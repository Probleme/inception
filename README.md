# Differences in image usage :
- **Without Docker Compose** :
- Manual container Management.
- Individual commands for each operation.
- **With docker compose** :
- Declarative configuration.
- Automated container orchestration.

# Benefits of Docker vs VMs :
- **Docker** :
- Lighter weight (shares host OS kernel).
- Faster startup times (seconds).
- Less ressource intensive.
- Better ressource intensive.
- Better ressource utilization.
- Easier to version and share.
- Consistent developmennt environments.
- **VMs** :
- Complete OS isolation.
- Higher ressource usage.
- Longer startup times(minutes).
- More overhead.
- Harder to version and share.

# What is Docker and Containers ?
- **Docker** is an open source platform that allows developers to automate the deoplyement and management of applications within lightweight isolated containers.
- **Containers** are lightweight form of virtualization that package an application and its dependencies into a standarized unit, ensure that the application runs consistently across different computing environments.
- **Containers** share the host OS kernel but run in isolated environments.

# Key Concepts in Docker :
- **Images** : A Docker image is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including code, runtime, libraries, and dependencies. Images are like blueprints for containers.
- **Containers** : A container is an instance of a Docker image running as an isolated process on a host machine. Containers are portable, consistent environments, so they work the same across various systems.
- **Dockerfile** : A dockerfile is a script containing instruntions to create Docker image. It defines what goes into the image and how it's configured.
- **Docker Engine** : This is the core of docker, responsible for managing containers, images, networking, and storage.

# how docker work ?
- **1-Build** : You write a Dockerfile with necessary instructions, and **Docker** uses it to create an image.
- **2-Run** : With the image built, you can start a container from it. Each container is isolated but can interact with other containers or external systems as configured.
- **3-Deploy** : Containers can be deploy to any system running **Docker**, making applications highly portable and reproducible.

# Docker Compose ?
**docker compose** is a tool for defining and running multi-container Docker applications. It allows you to specify multiple containers in a single **YAML** file, making it easy to manage and coordinate services that make up an application.

# Key concepts in Docker Compose :
- **Services** : Each component (e.g., web server, databse) is defined as a service in the docker-compose.yml file. Each service corresponds to a Docker container.
- **Networks** : Docker Compose allows you to define custom networks for services to communicate securely and efficiently.
- **Volumes** : You can also define shared storage between containers using volumes, wich make data persistence and sharing easy.

# How Docker compose work ?
- **Define services**: You write a docker-compose.yml file that specifies all the services required for your application, including the Docker images to use, ports to expose, volumes to mount, and networks to connect.
- **Bring up Services** : You run docker-compose up, and Docker compose will start all the services defined in the **YAML** file. Each service will run as a separate container.
- **Manage Services**: You can use docker-compose down to stop and remove containers, networks, and volumescreated by docker-compose up. Other commands like docker-compose stop, docker-compose restart, and docker-compose logs help to manage the running services.

# How docker compose work ?
## 1- Service definition :
- Each service becomes a container.
- Build points to directory with Dockerfile.
- Services can be configured independently.
## 2- Dependencies :
- Specifies service start order.
- MariaDB starts before wordpress.
## 3- Networking :
- Services in same network can communicate.
- Automatic DNS resolution between services.
## 4- Volume Management :
- Persistent data storage.
- Shared data between containers.
## 5- Environment Variables :
- Configure services via environment variables.
- Keep sensitive data separate.

# The difference between a Docker image used with docker compose and without docker compose ?
The primary difference between a Docker image used with Docker Compose and without Docker Compose is the way the image is managed and orchestrated, not the image itself. Docker Compose is a tool for running multi-container Docker applications, but the underlying images are the same in both cases.
## Without Docker compose :
When using Docker without Compose, you interact with Docker images and containers manually through the Docker CLI (docker command). You have to explicitly run each container individually and configure options like networks, ports, volumes, and environment variables using command-line flags.
```bash
docker run -d -p 3000:3000 --name frontend frontend-image
docker run -d -p 5432:5432 --name db postgres
docker network create my-network
docker network connect my-network frontend
docker network connect my-network db
```
## With Docker Compose :
When using Docker Compose, you still use the same Docker images, but the management and orchestration of multiple containers are done automatically based on the configuration defined in a docker-compose.yml file.
```yaml
services:
    frontend:
        image: frontend-image
        ports:
            - "3000:3000"
        
    db:
        image: postgres
        ports:
            - "5432:5432"
```
## The main difference are :
- Docker Compose automatically handles networking between containers.
- Configuration is declarative and version-controlled.
- Easier to manage multiple containers as a single application.
- Simpler commands for starting/stopping the entire stack.

# The benefit of Docker compared to VMs ?
## Docker advantages :
- Lighter weight (shares host OS kernel instead of running full OS).
- Faster startup (seconds vs minutes).
- Uses less ressources (MBs vs GBs).
- Better ressource utilization on host.
- Easier to version and distribute.
- More portableacross environments.
## VM advantages :
- Fuller isolation (complete OS).
- Can run different OS kernels.
- Better security isolation.
- More suitable for monolithic applications.

# The pertinence of the directory structure required for this project?
- **Modularity** : Each service has its own folder, making it easier to maintain and update without affecting other.
- **Separation of concerns** : Files like Dockerfile, configuration files, and environment variables are organized logically, so different components like (web server, database, etc.) are managed in isolation.
- **Scalability** : If you need to add new services in the future (e.g., Redis, or backup service), you can easily create a new folder under requirements.
- **Automation** : The Makefile and Docker Compose file ensure the project can be started and managed with simple commands, making deployment smoother and faster.

This structure mirrors best practice in containerized environments, ensuring that your project is clean, organized, and easy to scale or maintain.

