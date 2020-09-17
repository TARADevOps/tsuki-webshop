
## Installation with Docker and Docker-Compose ##

Tsuki Stak is a set of Docker containers providing a full backend composed of: 

* a backend database, 
* backend database object cache,
* PHP-FPM 7.4,
* Application Server


### Table of Content

* Architecture
* Requirements
* Clone the repo
* Clone & edit .env file
* Deployment with docker-compose
* Upgrade procedure

### Architecture

{ IMAGE COMING SOON }
  
### Requirements

    A dedicated online host machine
    OS: Linux
    Disk: 64GB - NVMe SSD is recommended
    RAM: 4GB
    Docker and Docker Compose installed on the host machine 
    (a recent version supporting v3 of docker-compose files, i.e. Docker Engine v17.04.0+ is recommended)
  
### Clone the repo

NOTE: This document going forth, assumes you are starting from the top level of the cloned repository

  $ git clone https://github.com/tsukidyomi/tsuki-stak.git

### Clone & edit .env file

The .env file, stored as a hidden file in the main directory needs your input. There is a .env_example that you can clone to start.

  $ cp .env_example .env

You now have a .env file. This file contains insecure default values for configuration options. During deployment this .env file is used to initialize the configuration files that will be used by your app. The values you input are used by your app to securely authenticate themselves.

  $ nano .env

This opens the .env file with the nano editor and you are now required to define certain values.

## Edit the following Mariadb variables:
MYSQL_ROOT_PASSWORD=rootpasswd
MYSQL_USER=user
MYSQL_PASSWORD=changeme
## Edit the following Wordpress variables:
MDB_USER=user
MDB_PASSWORD=changeme

### Deployment with docker-compose

  $ docker-compose up -d 


After a few moments you should see your WordPress app running at http://127.0.0.1:8080 ready to be configured.



** Live deployment @ https://www.tsuki.digital **