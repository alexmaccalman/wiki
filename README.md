# wiki- learning notes


to add an evironmental
```bash
Export PATH="$PATH:/NEW_PATH"

export PATH="$PATH:/c/Users/alexander.d.maccalma/Documents"
```
personal computer, adding docker paths
```bash
export PATH="$PATH:/c/Program Files/Docker/Docker/resources/bin"
```
to get env variables go to windows command shell and type:  
```powershell
rundll32.exe sysdm.cpl,EditEnvironmentVariables
```  

to enusre we include paths within our VS Code BAsh shell we can use a bash_profile. First vim into a file press insert and 

```bash
vim ~/.bash_profile
```  
To insert without TABS get auto-indented, press :set paste  
then paste the follwoing in the file:  
```bash
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

for _p in "/c/Program Files/Docker/Docker/resources/bin" /c/Users/alexander.d.maccalma/Documents; do
    if [[ ! "$PATH" =~ "$_p" ]]; then
        export PATH="${PATH:-}${PATH:+:}$_p"
    fi
done
unset _p
```  
then press esc to get our of edit mode. Then press :wq to save and quit vim.  

note to undo teh paste mode press :set nopaste  
THis sets it back to auto-indenting

we can add more environmental paths by adding to the list in the for loop. Separate by a space. IF there is a space in the folder path names, use quotes. 





