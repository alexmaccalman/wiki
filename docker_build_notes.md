# Notes on how to build a Docker from Power shell

- Get in bios. At start up, press F1, F2, and F8.  
- Navigate to Hyper V and enable it.  
- Download ubuntu from Microsoft App store
- setup Windows Service for Linux (WSL). Enter following commands in powershell
  
  ```powershell
  wsl --set-default-version 2
  wsl --set-default ubuntu
  wsl --set-version ubuntu 2
  ```  

After downloading Docker Desktop, Go to settings, Resources, WSL for Integration. Then turn ion Ubuntu.  

To run the linux container enter the following into powershell:  

```powershell
docker run --rm -it ubuntu:latest
```

## How to do a docker build

Build a shell script to run in BASH

```bash
#!/usr/bin/env bash
cd /opt/doe
java -jar DOE.jar 21 FALSE TRUE TRUE 100 200 100 0.1 0.5 100 3 0.2 100 20 0.2 3 3 0.05
find . \(  -name "*.csv" \! -name inputs.csv -print0 \) | xargs -0 cat
```

Write a Dockerfile (with no file extension).
Include any files in the copy statement

```bash
FROM ubuntu:latest
RUN apt update && apt install -y default-jre
COPY DOE.jar inputs.csv doe.sh /opt/doe/
ENTRYPOINT ["bash", "/opt/doe/doe.sh"]
```

use VS Code to convert from CRLF to LF for all .txt files  

Build an image  

```powershell
docker build -t doe .
```

Run the image

```powershell
docker run --rm -t doe
```

## Basic Docker Commands

list containers, -a lists all the running and stopped containers

```bash
docker ps
docker ps -a
```

stop a container

```bash
docker stop container_name_or_container_id
```

to remove container, to verify, use the ps -a command

```bash
docker rm container_name
```

to see a list of images

```bash
docker images
```

to remove an image

```bash
docker rmi image_name
```

to download the image and not run it

```bash
docker run image_name
```

Run in attached mode, meaning you will be attached to the console or the standard out of the container. Won't be able to do anytthing unless we CTTRL+C to quit to get back to prompt.  

```bash
docker run container_name
```

Run in the detacted mode to run in background mode and be able to use the prompt.  

```bash
docker run -d container_name
```

to attached back to the container. to get the id, only provide the first few characters  

```bash
docker attach container_id
```

to log in to a container and get into bash shell, to exit enter exit

```bash
docker run -it container_name bash
```

to pull a container, first looks locally if not there, looks to docker hub

```bash
docker pull image_name
```

run a docker container in detached mode and name it

```bash
docker run -d --name assign_a_name image_name
```

## Docker Run

To run a different version of an image use a tag

```bash
docker run image:version_number
```

the -i parameter is for interactive mode

```bash
docker run -i image
```

use a -t for a sudo terminal to get a prompt

```bash
docker -it image
```

For a user to access container we can use the internal IP assigned to the container inside the Docker Host

Or map a port inside the docker container using a -p parameter. Internal port is 5000 and external port for external user is port 80. This allows us to map different ports on docker host for multiple instances.  

```bash
docker run -p 80:5000 image
```

### Volume Mapping  

To persist data we need to map a directory outside of the container on docker host to a directory inside the container.  

```bash
docker run -v directory_outside_in_the_host:directory_inside_container image
docker run -v /opt/datadir:/var/lib/mysql mysql
```

The docker inspect command get more details about a container in a json format.  

```bash
docker inspect container_name
```  

### Container Logs  

to see the logs of the container in the background, use log command.  

```bash
docker log container_name
```  

## Docker Images  

FROM is the start from a base OS or another image
RUN installs all dependencies
COPY copy files from local system on to the local image (usually the source code)
ENTRYPOINT allows us to specify a command when container runs

```bash
docker run -it ubuntu bash
```  




