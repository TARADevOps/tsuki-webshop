    NOTE: View [DOCKER_setup.md](https://github.com/tsukidyomi/tsuki-stak/blob/master/DOCKER_setup.md) for instructions on how to deploy.
    
# Tsuki Stak

Dockerized WordPress 5 (PHP-FPM 7.4), with Nginx on Alpine Linux
 
### What is this ?

A docker-compose deployment of a single site WordPress instance using MariaDB as backing database with Redis for object caching & Nginx as the application server; based on Alpine Linux.

### Why Alpine Linux ?

Small. Simple. Secure.

Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox. It compiles all user-space binaries as position-independent executables with stack-smashing protection.

Because of its small size, it is commonly used in containers providing quick boot-up times.

More information at: https://www.alpinelinux.org/

### Why Docker ? 

Developing apps today requires so much more than writing code. Multiple languages, frameworks, architectures, and discontinuous interfaces between tools for each lifecycle stage creates enormous complexity. 

Docker simplifies and accelerates workflow, while giving developers the freedom to innovate with their choice of tools, application stacks, and deployment environments for each project.

More information at: https://docker.com/why-docker

### Why Docker-Compose ?

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application's services. Then, using a single command, you create and start all the services from your configuration.

More information at: https://github.com/docker/compose

### Why Nginx ?

The goal behind NGINX was to create the fastest web server around, and maintaining that excellence is still a central goal of the project. NGINX consistently beats Apache and other servers in benchmarks measuring web server performance. 

Since the original release of NGINX however, websites have expanded from simple HTML pages to dynamic, multifaceted content. NGINX has grown along with it and now supports all the components of the modern Web, including WebSocket, HTTP/2, and streaming of multiple video formats (HDS, HLS, RTMP, and others).

More information at: https://www.nginx.com

### Why WordPress ? 

WordPress is open source software used to create a beautiful websites & webapps.
Beautiful designs, powerful features, and the freedom to build anything you want. 

WordPress is both free and priceless at the same time.

More information at: https://wordpress.org

### Why Redis ?

Redis creates a new category in the database world. It combines the best of in-memory, schema-less design with optimized data structures and versatile modules that adapt to your data needs. 

The result is the most adept, high performance, multi-purpose database, that scales easily like a simple key-value data store but delivers sophisticated functionality with great simplicity.

More information at: https://redislabs.com/why-redis/

### Why MariaDB ?

Break free from the costs, constraints and complexity of proprietary databases and reinvest in what matters most, developing innovative applications and services as fast as possible. 

Experience the same benefits as customers like Deutsche Bank, DBS Bank, Nasdaq, Red Hat, ServiceNow, Verizon and Walgreens – industry leaders who trust MariaDB to deliver unmatched operational agility, provide enterprise reliability and drive collaborative innovation.

More information at: https://mariadb.com/

### Who are we ?

We are Tsuki (https://www.tsuki.digital) and this is our open source backend :)