# wsl configuration  

open powershell as admin and run this:  
```
## This is taken from https://gist.github.com/machuu/7663aa653828d81efbc2aaad6e3b1431 as a solution for
## connecting to the network from WSL while on the VPN
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000  
```  
to reslove DNS modif the reslv.conf file:  
```
sudo nano /etc/resolv.conf
```  
Modify the file to have this:  
nameserver 10.10.10.24  
nameserver 10.10.10.25   
nameserver 10.10.20.19  
nameserver 10.10.20.20  

Then edit or create wsl config file:  
```
cd /etc  
```  
Check if it is there:  
``` 
ls -l | grep wsl.conf
```  
create or editi it:  
```
sudo nano wsl.conf
```  
add this:  
[network]  
generateResolvConf = false  
 
[automount]  
enabled = true  
options = "metadata"  
mountFsTab = false  

use Ctrl + O to save changes and Ctrl + X to exit.  

Then shutdown wsl  
```
wsl --shutdown
```  

Reopen VS Code and connect to remore WSL.  

[See this repo for more information.](https://gist.github.com/machuu/7663aa653828d81efbc2aaad6e3b1431)  

