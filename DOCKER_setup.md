
## Installation with Docker and Docker-Compose ##

Tsuki Stak is a set of Docker containers providing a full backend composed of: 

* backend database, 
* backend database object cache,
* PHP-FPM 7.4,
* WordPress 5.5.1
* Application Server

### Table of Content

i)   Architecture
ii)  Requirements
iii) Clone the repo
iv)  Copy & edit .env file
v)   Deployment with docker-compose
vi)  Stop Containers
vii) Remove Containers

### Architecture

{ IMAGE COMING SOON }
  
### Requirements

* KVM or similiar hypervisor
* OS: Linux
* Disk: 64GB - NVMe SSD is recommended
* RAM: 4GB
* Docker and Docker Compose installed on the host machine 

A recent version supporting v3 of docker-compose files is recommended
i.e. Docker Engine v17.04.0+ 
  
### STEP 1: Clone the repo

    git clone https://github.com/tsukidyomi/tsuki-stak.git

### STEP 2: Clone & edit .env file

The .env file, stored as a hidden file in the main directory needs your input. There is a .env_example that you can clone to start.

    cp .env_example .env

You now have a .env file. This file contains insecure default values for configuration options. During deployment this .env file is used to initialize the configuration files that will be used by your app. The values you input are used by your app to securely authenticate themselves.

    nano .env

This opens the .env file with the nano editor and you are now required to define certain values.

* Edit the following Mariadb variables:

    MYSQL_ROOT_PASSWORD=rootpasswd
    MYSQL_USER=user
    MYSQL_PASSWORD=changeme

* Edit the following Wordpress variables:

    MDB_USER=user
    MDB_PASSWORD=changeme

Exit the file by pressing and holding ctrl + x. This will initiate a prompt that will ask if you wish to save the changes, press Y and Enter. You now have a .env file ready to use for deployment.

### STEP 3: Deployment with docker-compose

    docker-compose up -d 


After a few moments you should see your WordPress app running at http://127.0.0.1:8080 ready to be configured.

### Stop Containers

    docker-compose down


