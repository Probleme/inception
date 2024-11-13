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

# Key concepts in Docker Compose :
- **Services** : Each component (e.g., web server, databse) is defined as a service in the docker-compose.yml file. Each service corresponds to a Docker container.
- **Networks** : Docker Compose allows you to define custom networks for services to communicate securely and efficiently.
- **Volumes** : You can also define shared storage between containers using volumes, wich make data persistence and sharing easy.

## We said earlier that docker containers share  the underlying kernel. So what does actually mean, Sharing the kernel ?
Let's say we have a system with an **Ubuntu** OS with **Docker** installed on it.
**Docker** can run any flavor of OS on top of it, as long as they're all based on the same kernel. In this case **Linux**. If the underlying OS is **Ubuntu**, **Docker** can run a container based on another distribution like Debian, Fedora, Susi or Centos each docker container only has the additional software that we just talked about in the previous slide that makes these operating systems different. And **Docker** utilizes the underlying kernel of the Docker Host, wich works with all OSS above.

# What is an OS does not share the same kernel?
The OS that not share the kernel is **Windows**. And so we won't be able to run a **Windows** based Container on a Docker Host with linux on it. For that we will require docker on a Windows Server.
When we install **Docker** on **Windows** and run a Linux container on Windows, we not really running a linux container on windows, **Windows** runs a linux container on a linux virtual machine under the hoods. So it's really a Linux container on on linux virtual machine on windows.

# Isn't that a disadvantage then not being able to run another kernel on the OS ?
the answer is **No**. Because unlike hypervisors, Docker is not meant to virtualize and run different operating systems and kernels on the same hardware. The main purpose of Docker is to package and containerize applications and to ship them and to run them anywhere anytime, as many as we want. 