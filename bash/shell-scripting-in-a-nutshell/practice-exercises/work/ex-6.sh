#!/bin/bash

# prompt the user for a name of a file or directory
#read -p "Enter a name of a file or directory: " FILE_OR_DIRECTORY
#FILE_OR_DIRECTORY=$1

FILE_OR_DIRECTORY=$@
for FILE_OR_DIRECTORY in $@
do
  # report if it is a regular file, a directory, or other type of file
  if [ -f "$FILE_OR_DIRECTORY" ]
  then
    echo "$FILE_OR_DIRECTORY is a regular file."
  elif [ -d "$FILE_OR_DIRECTORY" ]
  then
    echo "$FILE_OR_DIRECTORY is a directory."
  else
    echo "$FILE_OR_DIRECTORY is something other than a regular file or directory."
  fi

  # perform an ls command against the file or directory with the long listing option.
  ls -l "$FILE_OR_DIRECTORY"
done


