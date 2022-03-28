# Notes on how to build a Docker from Power shell

- Get in bios. At start up, press F1, F2, and F8.  
- Navigate to Hyper V and enable it.  
- Download ubuntu from Microsfot App store
- setup Windows Service for Linux (WSL). Enter follwoing commands in powershell
  
  ```powershell
  wsl --set-default-version 2
  wsl --set-default ubuntu
  wsl --set-version ubuntu 2
  ```  

After downloding Docker Destktop, Go to settings, Resources, WSL for Intergration. Then turn ion Ubuntu.  

To run the linux container enter the follwoing into powershell:  
```powershell
docker run --rm -it ubuntu:latest
```
## How to do a docker build

Build a shell script to run in BASH

```bash
#!/usr/bin/env bash
cd /opt/doe
java -jar DOE.jar 21	FALSE	TRUE	TRUE	100	200	100	0.1	0.5	100	3	0.2	100	20	0.2	3	3	0.05
find . \(  -name "*.csv" \! -name inputs.csv -print0 \) | xargs -0 cat
```

Write a Dockerfile (with no file extention). 
Include any files in the copy statement

```
FROM ubuntu:latest
RUN apt update && apt install -y default-jre
COPY DOE.jar inputs.csv doe.sh /opt/doe/
ENTRYPOINT ["bash", "/opt/doe/doe.sh"]
```
use VS Code to convert from CRLF to LF for all .txt files  


Buils an image  

```powershell
docker build -t doe .
```

Run the image 

```powershell
docker run --rm -t doe
```
## Basic Docker Commands

list containers, -a lists all the running and stopped containers 
```
docker ps
docker ps -a
```
stop a container
```
docker stop contianer_name_or_container_id
```
to remove container, to verify, use the ps -a command
```
docker rm container_name
```
to see a list of images
```
docker images
```
to remove an image
```
docker rmi image_name
```
to download the image and not run it
```
docker run image_name
```
Run in attached mode, meaning you will be attached to the console or the standard out of the container. Won't be able to do anytthing unless we CTTRL+C to quit to get back to prompt.  
``` 
docker run container_name
```
Run in the detacted mode to run in background mode and be able to use the prompt.  
```
docker run -d container_name
```
to attached back to the container. to get the id, only provide the firstr few characters  
```
docker attach container_id
```
to log in to a container and get into bash shell, to exit enter extit
```
docker run -it contianer_name bash
```
to pull a container, first looks locally if not there, looks to docker hub
```
docker pull image_name
```








