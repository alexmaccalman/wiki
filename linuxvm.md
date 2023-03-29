## Build a Juypter Environment in an Azure Ubuntu VM

First create a config file inside of the .ssh directory. cd into the home directory with ~. remember to is this command to see the .ssh folder. 
```
cd ~
ls -a
cd .ssh
touch config
```
```
Host mltest  
    Hostname <insert the linux ip here>  
    user azureuser  
    port 22  
    IdentityFile ~/.ssh/ml_test.pem  
```
Once we create the linux VM in Azure, use the follwoing to copy the downloaded pem file to the .ssh directory:
```
cp /mnt/c/Users/alexm/Downloads/ml_test.pem .
```  
Note the "." copies it to the current directory, .ssh

after runnig the above, we have to change the security settings to protect the key 
```
chmod 400 ml_test.pem
```

With the above config file in .ssh folder you can simply run ssh ml-test. The IdentityFile is the pem file when we download from Azure

```
ssh ml_test
```
Following these instruction to install docker: https://docs.docker.com/engine/install/ubuntu/

Then go to this sire to get the docker run command for Juypter notebook: https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html

modify the run command to run on port 80 instead of 10000:
```
docker run -it --rm -p 80:8888 -v "${PWD}":/home/jovyan/work jupyter/datascience-notebook:2023-02-28
```










