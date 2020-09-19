
# Docker-Compose Deployment

## Overview:

Desired result of the following document is a deployment of a stack of Docker containers providing a production ready backend that serves PHP code to the application server utilizing PHP-FPM with built in SSL termination & WAF - all ochestrated and managed by Docker-Compose. 

This deployment is comprised of the following technologies: 
```env
i)    Alpine Linux : Container Operating System
ii)   MariaDB      : Relational Database Management System (RDBMS)
iii)  Redis        : In-Memory, Schema-Less Database Object Caching
iv)   PHP 7.4      : General-Purpose Scripting Language
v)    WordPress 5  : Content Management System (CMS)
vi)   PHP-FPM      : PHP FastCGI Process Manager
vii)  Nginx        : Application Server
viii) Caddy        : Reverse Proxy (SSL termination + Web Application Firewall)
```

### Table of Content

* Architecture
* Requirements
* Preparing Host Machine
* STEP 1 : Clone the repository
* STEP 2 : Create and define .env
* STEP 3 : Deployment with docker-compose
* X
* X
* X
* Stop and Remove Containers


### Architecture

{ IMAGE COMING SOON }
  
### Requirements

* KVM or Similiar Cloud Hypervisor
* OS: Linux (Debian 10) with Root Privileges and a secondary SUDO USER
* Disk: 64GB - NVMe SSD is recommended 
* RAM: 4GB   - DDR4 ECC is recommended
* Docker and Docker-Compose installed on the host machine
* A Fully Qualified Domain Name (FQDN)
* An 'A DNS record' with your FQDN pointing to your server’s public IP address

A recent version supporting v3 of docker-compose files is recommended
i.e. Docker Engine v18.06.0+ 

### Preparing Host Machine

SSH into the host machine : 

$   ssh root@PUBLIC_IP_ADDRESS

Create a secondary SUDO USER

    https://linuxhint.com/create_new_sudo_user_debian10/

Disable root SSH access & enable NEW_USER public-key only access :

    https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-debian-10

    https://www.tecmint.com/disable-or-enable-ssh-root-login-and-limit-ssh-access-in-linux/
    
Confirm Seconday User has SSH access from a new shell : 

$   ssh NEW_USER@PUBLIC_IP_ADDRESS

Ensure Docker & Docker-compose is installed : 

    https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10

    https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-debian-10

Register a Domain Name and point it to your server : 

    https://www.namecheap.com/support/knowledgebase/article.aspx/10072/35/how-to-register-a-domain-name

    https://www.namecheap.com/support/knowledgebase/article.aspx/319/2237/how-can-i-set-up-an-a-address-record-for-my-domain

Enable Uncomplicated Firewall (UFW) :
    
$   sudo ufw allow ssh 
$   sudo ufw default deny incoming
$   sudo ufw default allow outgoing
$   sudo ufw alow http
$   sudo ufw allow https
$   sudo systemctl enable ufw
$   sudo ufw status verbose

Install git :

   sudo apt install -y git

### STEP 1: Clone the repository

   git clone https://github.com/tsukidyomi/tsuki-stak.git tsuki-webshop

### STEP 2: Create & define .env

The .env file, stored as a hidden file in the main directory, requires your input. There is a .env_example that you can copy to start.

   cp .env_example .env

You now have a .env file. This file contains insecure default values for configuration options. 

During deployment this .env file is used to initialize the configuration files that will be used by your app. The values you input are used for secure authentication.

   nano .env

This opens the .env file with the nano editor and you are now required to define certain values.

Example `.env` file (default values):

```env
# Mariadb variables:
MARIADB_VERSION=10.5
MYSQL_ROOT_PASSWORD=rootpasswd
MYSQL_USER=user
MYSQL_PASSWORD=changeme
MYSQL_DATABASE=rdbms
# Redis variables:
REDIS_VERSION=6
# Wordpress variables:
WP_VERSION=5-php7.4-fpm-alpine
MDB_USER=user
MDB_PASSWORD=changeme
MDB_NAME=rdbms
MDB_TABLE_PREFIX=wp_
# Nginx variables:
NGINX_VERSION=stable-alpine
# Binded Volumes:
NGINX_CONF_DIR=./nginx
NGINX_LOG_DIR=./logs/nginx
WP_DATA_DIR=./wordpress

```

Edit the following:

```env
# Mariadb variables:
MYSQL_ROOT_PASSWORD=rootpasswd
MYSQL_USER=user
MYSQL_PASSWORD=changeme

# Wordpress variables:
MDB_USER=user
MDB_PASSWORD=changeme

```
Replace "rootpasswd", "user" & "changeme". Exit the file by pressing and holding ctrl + x. This will initiate a prompt that will ask if you wish to save the changes, press Y and Enter. 

You now have a .env file ready to use for deployment.

### STEP 3: Deployment with docker-compose

   docker-compose up -d 


After a few moments you should see your WordPress app running at https://www.yourdomain.com ready to be configured.



## Further Notes:

### Bring down the deployment

   docker-compose down

### Stop & Remove All Containers

   docker stop $(docker ps -a -q)
   docker rm $(docker ps -a -q)

