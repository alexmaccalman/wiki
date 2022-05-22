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

## I/O Redirection
if we have a program called do_something that reads from stdin and writes to stdout and stderr, we can change its input source by using the less-than sign (<) followed by the name of the file to be consumed for input data:

$ do_something < input-file

If you want to send the output to a file, use the greater-than sign (>) as in:

$ do_something > output-file

Because stderr is not the same as stdout, error messages will still be seen on the terminal windows in the above example.

If you want to redirect stderr to a separate file, you use stderr’s file descriptor number (2), the greater-than sign (>), followed by the name of the file you want to hold everything the running command writes to stderr:

$ do_something 2> error-file

NOTE: By the same logic, do_something 1> output-file is the same as do_something > output-file.

A special shorthand notation can send anything written to file descriptor 2 (stderr) to the same place as file descriptor 1 (stdout): 2>&1.

$ do_something > all-output-file 2>&1

bash permits an easier syntax for the above:

$ do_something >& all-output-file

## Pipes
You can pipe the output of one command or program into another as its input.

In order to do this, we use the vertical-bar, pipe symbol (|), between commands as in:
 
$ command1 | command2 | command3

## Locate  
To get a shorter (and possibly more relevant) list, we can use the grep program as a filter. grep will print only the lines that contain one or more specified strings, as in: 

$ locate zip | grep bin

which will list all the files and directories with both zip and bin in their name. We will cover grep in much more detail later. Notice the use of | to pipe the two commands together.

locate utilizes a database created by a related utility, updatedb. Most Linux systems run this automatically once a day. However, you can update it at any time by just running updatedb from the command line as the root user.

## Wildcards

? 	Matches any single character  
/*	Matches any string of characters  
[set]	Matches any character in the set of characters, for example [adf] will match any occurrence of a, d, or f  
[!set]	Matches any character not in the set of characters    

## Find  
Searching for files and directories named gcc:

$ find /usr -name gcc

Searching only for directories named gcc:

$ find /usr -type d -name gcc

Searching only for regular files named gcc:

$ find /usr -type f -name gcc  

To find and remove all files that end with .swp:

$ find -name "*.swp" -exec rm {} ’;’

The {} (squiggly brackets) is a placeholder that will be filled with all the file names that result from the find expression, and the preceding command will be run on each one individually.

Please note that you have to end the command with either ‘;’ (including the single-quotes) or "\;". Both forms are fine.  

## Finding files based on time or size  
To find files based on time:

$ find / -ctime 3

Here, -ctime is when the inode metadata (i.e. file ownership, permissions, etc.) last changed; it is often, but not necessarily, when the file was first created. You can also search for accessed/last read (-atime) or modified/last written (-mtime) times. The number is the number of days and can be expressed as either a number (n) that means exactly that value, +n, which means greater than that number, or -n, which means less than that number. There are similar options for times in minutes (as in -cmin, -amin, and -mmin).

To find files based on sizes:

$ find / -size 0

Note the size here is in 512-byte blocks, by default; you can also specify bytes (c), kilobytes (k), megabytes (M), gigabytes (G), etc. As with the time numbers above, file sizes can also be exact numbers (n), +n or -n. For details, consult the man page for find.

For example, to find files greater than 10 MB in size and running a command on those files:

$ find / -size +10M -exec command {} ’;’  








