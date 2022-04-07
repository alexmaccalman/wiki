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
docker run - Host_Port:Container_Port image_name
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

start a ubuntu container and use -i for interactive mode and -t to get a sudo terminal prompt 
```bash
docker run -it ubuntu bash
```  
install python in ubuntu container. First update the package index
```bash
apt-get update
```
then install python3
```bash
apt-get install -y python3
```
then install python pip
```bash
apt-get install python3-pip
```
then install flask
```bash
pip install flask
```
flask app source code
```python
import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome!"

@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
```
enter the following command in terminal and paste the above in
```bash
cat > opt/app.py
```
then CTRL+C out and enter this after cd into the opt folder
```bash
FLASK_APP=app.py flask run --host=0.0.0.0
```
run the history command and paste in the instructions into a .txt file
enter exit to get out of the container
create a directory for the docker build files
```bash
mkdir my-simple-webapp
cd my-simple-webapp
```
create a docker file
```bash
cat > Dockerfile
FROM ubuntu

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip install flask

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
```
create an app.py file and paste the above app source code in to create it
```bash
cat > app.py
import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome!"

@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
```
then CTRL+C out and run the Docker Build command
```bash
docker build .
```
to add a tag run this command
```
docker build . -t my-simple-webapp
```
to tag with a docker account name
```
docker build . -t alexmaccalman/my-simple-webapp
```
Then log into Docker Hub
```bash
docker login
```
then push
```bash
docker push alexmaccalman/my-simple-webapp
```
### Environment Variables
In the source code, the following sets the environment variable
```python
import os
color = os.environ.get('APP_COLOR')
```
to set an env variable, use this command
```bash
docker run -e APP_COLOR=green simple-webapp-color
```
### CMD and ENTRYPOINT
the command line parameter uses the CMD in hte Dockerfile
The entry point specifies the program to be run when the container starts
FROM ubuntu  
ENTRYPOINT ["sleep"]
CMD ["5"]

to override the entrypoint command use this:
```bash
docker run --entrypoint sleep2.0 ubuntu-sleeper 10
```


## Docker Compose
Docker-compose.yml is a file that can bring together a number of containers as services.  
To bring up the whole docker compose stack use this (this only works on a single docker host)
```bash
docker-compose up
```
### link
to link containers together we use the link command. The names of the containers we assign is important. These names are used in the code for reference. 
```bash
docker run -d --name=vote -p 5000:80 --link redis:redis voting-app
```
### Docker compose - build  


### Docker compose - versions  
specify version at the top of the file  
the depends_on: command enures a contianer is up before another container. 
networks: command list the networks we will use at the bottom of .yml. Then add network: to the service section. 

# Docker Voting-app Demo

- clone repo to get source code [repo](https://github.com/dockersamples/example-voting-app)  
- build voting-app image. 5000 is my local host and 80 is the container port to interface with a browser
```bash
docker run -p 5000:80 voting-app
```
- pull down a redis image and run it
```bash
docker run -d --name=redis redis
```
- the voting-app is not linked to the redis. stop the voting-app and then link it to the redis container
```bash
docker stop imageID
docker run -p 5000:80 --link redis:redis voting-app
```
- deploy a postgres database. Go into the docs to find out which postgres image version they used. Look inside the Docker compose file [file](https://github.com/dockersamples/example-voting-app/blob/master/docker-compose.yml)   Be sure to dame it 'db' so we can use later as a link. Note, the container needs an environmental variable password  
```bash
docker run -e POSTGRES_PASSWORD=password -d --name=db postgres:9.4
```  
- build and deploy the worker. change directory to worker. use -t to tag it with a name.  
```bash
cd ../worker/
docker build . -t worker-app
``` 
- run the the worker-app and link to redis and db  
```bash
docker run --link redis:redis --lin db:db worker-app
```
- build and deploy the result container, use -t to tag it with a name.  
```bash
cd result
docker build . -t result-app
```
run the result-app container, map the 5001 port to port 80 and link to the db
```bash
docker run -p 5001:80 --link db:db result-app
```

# Docker Compose demo voting-app   

Docker compose is a separate download. It comes with Docker Desktop. To download to linux, follow instructions [here](https://docs.docker.com/compose/install/).  Ensure the preciosu containers are stopped.
- Create a docker-compose.yml file
```bash
cat > docker-compose.yml
redis:

db:

vote:

worker:

result:
```
CTRL+C to get out of the file and then edit the file  
```bash
vi docker-compose.yml
```
in edit mode of terminal , press the insert key to edit and write the following:
redis:  
  image: redis  

db:  
  image: postgres:9.4  

vote:  
  image: voting-app  
  ports:  
    - 5000:80  
  links:  
    - redis  

worker:  
  image: worker-app  
  links:  
    - db  
    - redis  

result:
  image: result-app
  ports:
    - 5001:80
  links:
    - db
  
When finished editing, press esc to get out of insert mode then type :wq to get out of edit model  

- Then use the docker compose up command
```bash
docker-compose up
```  

### Docker References  
[Docker Compose](https://docs.docker.com/compose/)  
[Docker Compose Engine](https://docs.docker.com/engine/reference/commandline/compose/)  


### Docker Registry  

To use a private registry you first login to the private registry. 
```bash
docker login private-registry.io
``` 
to run once logged in use this command.  
```bash
docker run private-registry.io/apps/internal-app
```  
to build our own private docker registry, use an image call registry, expose on port 5000.  
```bash
docker run -d -p 5000:5000 --name registry registry:2
```  
to push an image to it use this command to tag it.  
```bash
docker image tag my-image localhost:5000/my-image
```  
to push an image to the local private registry use this command.  
```bash
docker push localhost:5000/my-image
```  
To pull the image, from a a local host use this command.  
```bash
docker pull localhost:5000/my-image
```  
to access from another host use the ip or domain name of the host.  
```bash
docker pull 192.188.56.1000:5000/my-image
```  
to check the list of images pushed use this command.  
```bash
curl -X GET localhost:5000/v2/_catalog
```  
to remove all the dangling mages we have localy use this command.  
```bash
docker image prune -a
```  









