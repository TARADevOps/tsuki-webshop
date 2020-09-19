### !!! Work In Progress !!!

Deployment Manual : https://github.com/tsukidyomi/tsuki-stak/blob/master/DOCKER_setup.md
    
# Tsuki Webshop Deployment

## Dockerized WordPress 5 (PHP 7.4), PHP-FPM, Nginx & Caddy Server Built on Alpine Linux

A Docker-Compose deployment of a single site WordPress instance that is served via PHP-FPM to Nginx relying on MariaDB as the backing database with Redis for in-memory object caching; built on Alpine Linux.

### Alpine Linux ?

Small. Simple. Secure.

Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox. It compiles all user-space binaries as position-independent executables with stack-smashing protection.

Because of its small size, it is commonly used in containers providing quick boot-up times.

More information at: https://www.alpinelinux.org/

### Docker ? 

Developing apps today requires so much more than writing code. Multiple languages, frameworks, architectures, and discontinuous interfaces between tools for each lifecycle stage creates enormous complexity. 

Docker simplifies and accelerates workflow, while giving developers the freedom to innovate with their choice of tools, application stacks, and deployment environments for each project.

More information at: https://docker.com/why-docker

### Docker-Compose ?

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application's services. Then, using a single command, you create and start all the services from your configuration.

More information at: https://github.com/docker/compose

### Caddy ?

Caddy 2 is a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go

Caddy simplifies your infrastructure. It takes care of TLS certificate renewals, OCSP stapling, static file serving, reverse proxying, Kubernetes ingress, and more.

More information at: https://caddyserver.com/

### Nginx ?

The goal behind NGINX was to create the fastest web server around, and maintaining that excellence is still a central goal of the project. NGINX consistently beats Apache and other servers in benchmarks measuring web server performance. Nginx also pairs well with PHP-FPM.

More information at: https://www.nginx.com

### PHP-FPM ?

PHP-FPM (FastCGI Process Manager) is an alternative PHP FastCGI implementation with some additional features useful for sites of any size, especially busier sites. 

These features include:

* Adaptive process spawning
* Basic statistics (ala Apache's mod_status)
* Advanced process management with graceful stop/start
* Stdout & stderr logging
* Emergency restart in case of accidental opcode cache destruction
* Accelerated upload support
* Support for a "slowlog"
* Enhancements to FastCGI, such as fastcgi_finish_request()

More information at: https://php-fpm.org/about/

### WordPress ? 

WordPress is open source software used to create a beautiful websites & webapps.
Beautiful designs, powerful features, and the freedom to build anything you want. 

WordPress is both free and priceless at the same time.

More information at: https://wordpress.org

### Redis ?

Redis creates a new category in the database world. It combines the best of in-memory, schema-less design with optimized data structures and versatile modules that adapt to your data needs. 

The result is the most adept, high performance, multi-purpose database, that scales easily like a simple key-value data store but delivers sophisticated functionality with great simplicity.

More information at: https://redislabs.com/why-redis/

### MariaDB ?

Break free from the costs, constraints and complexity of proprietary databases and reinvest in what matters most, developing innovative applications and services as fast as possible. 

Experience the same benefits as customers like Deutsche Bank, DBS Bank, Nasdaq, Red Hat, ServiceNow, Verizon and Walgreens – industry leaders who trust MariaDB to deliver unmatched operational agility, provide enterprise reliability and drive collaborative innovation.

More information at: https://mariadb.com/

### Who are we ?

We are Tsuki (https://www.tsuki.digital) and we are proudly open sourced.