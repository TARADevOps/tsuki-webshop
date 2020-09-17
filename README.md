Dockerized WordPress 5 with Nginx and PHP-FPM 7.4

Docker-compose deployment of a single site WordPress instance using MariaDB as the database with REDIS for object cache & NGINX as the application server.

What is WordPress?

WordPress is an open source CMS used to create beautiful websites & webapps.
More information at https://wordpress.org



Tsuki-Stak is a set of Docker containers providing a full backend composed of: 
    • a backend database, 
    • backend database object cache, 
    • PHP-FPM 7.4,  
    • Application Server

  $ git clone https://github.com/tsukidyomi/tsuki-stak.git
  $ cd tsuki-stak
  $ cp .env_example .env
	# Edit .env as required
  $ docker-compose up -d 



After a few moments you should see your site running at http://127.0.0.1:8080 ready to be configured.



Live deployment @ https://www.tsuki.digital

