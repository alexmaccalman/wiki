#!/bin/bash

# check if "/etc/shadow" exsits
if [ -e "/etc/shadow" ]
then
  echo "Shadow passwords are enabled."
  # check if "/etc/shadow" is writable
  if [ -w "/etc/shadow" ]
  then
    echo "You have permissions to edit /etc/shadow."
  else
    echo "You do NOT have permissions to edit /etc/shadow."
  fi
else
  echo "Shadow passwords are NOT enabled."
fi