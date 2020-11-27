
# Docker-Compose Deployment

## Overview:

Desired Outcome of this Document is a Deployment of a Stack of Docker Containers providing a Production Backend that serves a WordPress Application via the FASTCGI Application Server to the Web Server with built in FastCGI Cache & Brotli Compression. 

The Reverse Proxy handles Secure Domain Name Validation, Auto TLS Management & Application Firewall. 

Automation & Orchestration by Docker-Compose. Developer / Admin UI by Portainer.

This deployment is comprised of the following technologies: 
```env
I)    Alpine Linux OS : Container Operating System
II)   MariaDB         : Relational Database Management System ( RDBMS )
III)  RedisDB Cache   : In-Memory, Schema-Less Database Object Cache
IV)   PHP 7.4         : Hypertext Preprocessor ( General-Purpose Scripting Language )
V)    WordPress 5     : Content Management System ( CMS )
VI)   PHP-FPM         : Application Server ( FastCGI Process Manager )
VII)  Nginx           : Web Server ( FASTCGI_CACHE & Lossless Compression )
VIII) Caddy           : Reverse Proxy ( HTTP/3 | TLS Management | Application Firewall  )
IX)   Portainer       : Container Management UI
```

### Table of Content

* Architecture
* Requirements
* Preparation
* Clone Repository
* Environment Variables
* Add Directories with Permissions
* Configure Caddyfile
* Deployment with Docker-Compose
* WordPress Installation & Configuration
* Update Wp-Config.Php
* Portainer Admin UI
* Stoppage of Deployment
* Removal of Containers

### Architecture

![tsuki_arch](https://user-images.githubusercontent.com/75030055/100434420-bedb3300-309c-11eb-9bbd-1a47c7fbcbad.png)
<<<<<<< HEAD

=======
  
>>>>>>> 3bd33229f7d8470515a42b08eae2d14555256883
### Requirements

* KVM, LXC or Similiar Cloud Hypervisor
* OS: Linux (Debian 10) with Root Privileges
* Docker and Docker-Compose installed on the host machine
* A Fully Qualified Domain Name (FQDN)
* An 'A DNS record' with your FQDN pointing to your server’s public IP address

### Preparation

Register a Domain Name AND point it to your server : 

* https://www.namecheap.com/support/knowledgebase/article.aspx/10072/35/how-to-register-a-domain-name

* https://www.namecheap.com/support/knowledgebase/article.aspx/319/2237/how-can-i-set-up-an-a-address-record-for-my-domain


SSH into the host machine : 

    ssh root@PUBLIC_IP_ADDRESS

Create a secondary SUDO USER

* https://linuxhint.com/create_new_sudo_user_debian10/

Disable root SSH access & enable NEW_USER public-key only access :

* https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-debian-10

* https://www.tecmint.com/disable-or-enable-ssh-root-login-and-limit-ssh-access-in-linux/
    
Confirm Seconday User has SSH access from a new shell : 

    ssh NEW_USER@PUBLIC_IP_ADDRESS

Ensure Docker & Docker-compose is installed : 

* https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10

* https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-debian-10

Enable Uncomplicated Firewall (UFW) :
    
    sudo ufw allow ssh 
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw alow http
    sudo ufw allow https
    sudo systemctl enable ufw
    sudo ufw status verbose

Install git :

    sudo apt install -y git

### STEP 1: Clone Repository

    git clone https://github.com/techwise-technologies/tsuki-webshop.git my-webshop
    cd my-webshop/

### STEP 2: Environment Variables

The .env file, stored as a hidden file in the main directory, requires your input. There is a .env_example that you can copy to start.

    cp .env_example .env

You now have a .env file. This file contains insecure default values for configuration options. 

During deployment this .env file is used to by YOUR WordPress Application to initialize the configuration files. The values you input are used for secure authentication between the Services running within the Docker Containers. It is important to keep a copy of the values you input as only you have them.

    nano .env

This opens the .env file with the nano editor and you are now required to define certain values.

Example `.env` file (default values):

```env
# Volumes on Host
CADDYFILE=./Caddyfile
CADDY_DATA_DIR=./caddy/data
CADDY_CONF_DIR=./caddy/config
NGINX_CONF_DIR=./nginx
NGINX_LOG_DIR=./logs/nginx
WORDPRESS_DATA_DIR=./wordpress

# WordPress
WORDPRESS_DB_NAME=yourdomain_com_wp                      <------------ EDIT THIS   ## leave the trailing _wp
WORDPRESS_TABLE_PREFIX=wp_
WORDPRESS_DB_HOST=db
WORDPRESS_DB_USER=yourdomain_com                         <------------ EDIT THIS
WORDPRESS_DB_PASSWORD=strong_password                    <------------ EDIT THIS

# Redis
REDIS_PASSWORD=very_very_strong_password                 <------------ EDIT THIS

# MariaDB
MYSQL_ROOT_PASSWORD=very_strong_password                 <------------ EDIT THIS
MYSQL_USER=yourdomain_com                                <------------ EDIT THIS
MYSQL_PASSWORD=strong_password                           <------------ EDIT THIS
MYSQL_DATABASE=yourdomain_com_wp                         <------------ EDIT THIS   ## leave the trailing _wp 

```
Replace all occurances of "yourdomain_com", "strong_password", "very_strong_password" & "very_very_strong_password" as desired. 
Exit the file by pressing and holding ctrl + x. This will initiate a prompt that will ask if you wish to save the changes, press Y and Enter. 

You now have a .env file ready to use for deployment.

### STEP 3: Add Directories with Permissions

    mkdir -p mariadb/ wordpress/cache/ caddy/ logs/nginx/


### STEP 4: Configure Caddyfile
   
    nano Caddyfile

This opens the  Caddyfile with the nano editor and you are now required to input your domain name.

```env
{
    experimental_http3
}

yourdomain.com, www.yourdomain.com {
        reverse_proxy 127.0.0.1:8080
}

devpanel.yourdomain.com {
        reverse_proxy 127.0.0.1:9000
}

```

Replace all occurances of "yourdomain.com" with your Desired domain name. 
Exit the file by pressing and holding ctrl + x. This will initiate a prompt that will ask if you wish to save the changes, press Y and Enter. 

### STEP 5: Deployment with Docker-Compose

Time to Deploy, Run this Command and Watch the code Execute. It may take a few minutes, be patient.

    docker-compose up -d 

If you Wish to View the Containers in the Shell

    docker ps

After a few moments you should see your WordPress app running at https://www.yourdomain.com & your Admin UI at https://devpanel.yourdomain.com ready to be configured.

### STEP 6: WordPress Installation & Configuration

Go to your domain and Follow the Steps to install WordPress. Keep a Copy of the Username & Password, this shall be the Admin Credentials for the WordPress Application. Log into the WordPress Admin Panel.

Go To Plugins on the Left Menu & Delete the 2 default options (Hello Dolly & Akismet). 

Add 2 New Plugins By Till Krüss :

    I)  Redis Object Cache
    II) Nginx Cache

Before Activating the Plugins, we have one more Step. 

### STEP 7: Update Wp-Config.Php

Navigate to the wordpress folder and open the wp-config.php in nano

    cd wordpress/
    sudo nano wp-config.php

Add The Following Settings just above the MYSQL entries:

    // ** REDIS settings ** //
    define( 'WP_CACHE_KEY_SALT', 'wp-docker-redis');
    define( 'WP_REDIS_HOST', 'redis');
    define( 'WP_REDIS_PASSWORD', 'very_very_strong_password');      <------------ EDIT THIS

Replace very_very_strong_password with the SAME value you used previously for this key. 
AND Add This at the very Bottom of the file:

    /** FTP updates fix. */
    define('FS_METHOD','direct');

Exit the file by pressing and holding ctrl + x. This will initiate a prompt that will ask if you wish to save the changes, press Y and Enter. 

Reload the Changes

    cd ..
    docker-compose up -d

In The WordPress Admin UI, Navigate To Plugins and Activate Redis & Nginx Cache.

Navigate to Redis Settings and "Enable Object Caching"
Navigate to Nginx Settings and Set the Path to "wordpress/cache"

Navigate to the Dashboard on the Left Menu Bar and Perform a Health Check to Verify you Have a Healthy Application.

### STEP 8: Portainer Admin UI

Navigate to Your DevPanel URL and Folow the Instructions to Create an Admin User. Keep a Copy of the Credentials. Log into the Admin UI.

### Stoppage of Deployment

    docker-compose down

### Removal of Containers

    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker image prune -a


