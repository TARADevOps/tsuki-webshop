
# Deployment of Docker Containers with Docker-Compose

## Overview:

The desired result of following this document is a deployment of a stack of Docker containers providing a production ready backend that serves PHP code to the application server utilizing PHP-FPM with built in SSL termination & WAF - all ochestrated and managed by Docker-Compose. 

The deployment is comprised of the following technologies: 

* Alpine Linux : Container Operating System
* MariaDB      : Relational Database Management System (RDBMS)
* PHP Redis    : In-Memory, Schema-Less Database Object Caching
* PHP 7.4      : General-Purpose Scripting Language
* WordPress 5  : Content Management System written in PHP
* PHP-FPM      : PHP FastCGI Process Manager
* Nginx        : Application Server
* Caddy        : Reverse Proxy (SSL termination + Web Application Firewall)

### Table of Content

```env
i)   Architecture
ii)  Requirements
iii) STEP 1 : Clone the repo
iv)  STEP 2 : Create required directories
v)   STEP 3 : Create and define .env file
vi)  STEP 4 : Deployment with docker-compose
vii) Remove Containers

```

### Architecture

{ IMAGE COMING SOON }
  
### Requirements

* KVM or Similiar Hypervisor
* OS: Linux with Root Privileges and a secondary Non-Root Account
* Disk: 64GB - NVMe SSD is recommended 
* RAM: 4GB   - DDR4 ECC is recommended
* A Fully Qualified Domain Name. This document will use your_domain throughout
* An A DNS record with your_domain pointing to your server’s public IP address
* Docker and Docker-Compose installed on the host machine 

A recent version supporting v3 of docker-compose files is recommended
i.e. Docker Engine v17.04.0+ 
  
### STEP 1: Clone the repo

    git clone https://github.com/tsukidyomi/tsuki-stak.git

### STEP 2: Create required directories

    mkdir -p mariadb/ redis/ wordpress logs/nginx/ caddy/ssl

### STEP 3: Create & define .env file

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

### STEP 4: Deployment with docker-compose

    docker-compose up -d 


After a few moments you should see your WordPress app running at https://www.yourdomain.com ready to be configured.

## Further Notes:

### Bring down the deployment

    docker-compose down

### Stop & Remove All Containers

    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)

