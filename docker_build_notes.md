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











