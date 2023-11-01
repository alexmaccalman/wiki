## Deploy Rancher

Find the desired linux distro here [DistroWatch](https://distrowatch.com/).  
I used [Fedora](https://fedoraproject.org/coreos/), a minimal disto good for containers.  

In Vmware Workstation, create a new virtual machine.  
Select Custon (advanced), use Workstation 17.x, install operating system later, select where to store the VM, 2 processors and 2 cores, select defaul amount of RAM, leave network type at NAT, leave LSI Logic and SATA as recommended, create a new virtual disk, bump up to 30 GB, and leave at split virutal disk file to make it easier to transfer the VM (slipt accross multiple files), hit next and finish.  
Now go into CD.DVD (SATA) and browese where the iso file is. 

The ubunut server would not boot becaUSE IT COMPLAINED ABOUT A MOUNTED ISO. To resolve this I had to create a empty iso withthe comand in bash and point the CD/DVD to is:  
``` bash  
dd if=/dev/zero of=empty.iso bs=1024 count=1
```
The fedora distro did not need an empy iso.  

To set up a network:  
In VMware Workstation, for each VM go to VM, settings, Network Adapter. Select Custom: Specific virtual network and select VMnet8 (NAT).  
The we can confirm that the VMs are on the same network by pinging withthis command:  
``` bash
ping <IP_address>
```
Inslall SSH one each machine, allowing us to boot strap the commands by copy paste.  
Update the distro, install nano for editing, net-tools to get network info, and openssh-server for ssh  
```bash
sudo apt-get update
sudo apt-get install -y nano net-tools openssh-server
sudo systemctl enable ssh
```
Now create a fire rule to allow port 22.  
```bash
sudo ufw allow ssh
sudo systemctl start ssh
```
now we need the IP address for Rancher to access it. 
```bash
sudo ifconfig
````



## Install Docker on all machines with theses commands:  
```bash
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
sudo service docker start
```
For the fedora distro I had to use these commands
```bash
sudo systemctl start docker
```

## Installing Rancher

[Rancher Instructions persistent Docker Install](https://ranchermanager.docs.rancher.com/v2.5/reference-guides/single-node-rancher-in-docker/advanced-options#persistent-data)  

Run these docker commands on the VM that will have Rancher:
```bash
sudo docker run -d --restart=unless-stopped \
  -p 80:80 -p 443:443 \
  -v /opt/rancher:/var/lib/rancher \
  --privileged \
  rancher/rancher:latest
```
[Rancher instructions on how to login and create a cluster](https://ranchermanager.docs.rancher.com/v2.5/getting-started/quick-start-guides/deploy-rancher-manager/helm-cli)  

Confirm the docker is running with sudo docker ps  
Open a browser and go to https://localhost and follow the instructions. BE sure to include the sudo command:  
sudo docker logs e04ddec2d222 2>&1 | grep "Bootstrap Password:" 
Enter the password

The Rancher server needs to be reachable from all our virtual and physical hardware. Must set the server URL for other machies to see the rancher server.  
Got to the Global Settings, scroll for Server URL and set the URL to the IP address where the rancher server is.   
## Create a Cluster  
In the home menu, click create and select Custom. Enter a cluster name, accept defaults, then press create.  
We have to wait for registration. Click on the cluster and go to registration. Check the Insecure to skip TLS and copy the registration command.  Run that command in each linux VM. 











