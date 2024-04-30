# wsl configuration  

open powershell as admin and run this:  
```
## This is taken from https://gist.github.com/machuu/7663aa653828d81efbc2aaad6e3b1431 as a solution for
## connecting to the network from WSL while on the VPN
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 6000  
```  
[Follow these sets to get the values nneded to update the reslv.config file](https://jamespotz.github.io/blog/how-to-fix-wsl2-and-cisco-vpn)  


to reslove DNS modif the reslv.conf file:  
```
sudo nano /etc/resolv.conf
```  
Modify the file to have this:  
nameserver <corporateDNS1>
nameserver <corporateDNS2>

To get <corporateDNS> addresses, use ipconfig /all from CMD or Powershell prompt, and check the details of the VPN adapter: 
Cisco AnyConnect Secure Mobility Client Virtual Miniport Adapter for Windows x64, see the DNS server ips.   


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

