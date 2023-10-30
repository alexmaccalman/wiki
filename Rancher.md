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



