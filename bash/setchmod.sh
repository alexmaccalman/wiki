#!/bin/bash

# Function to set chmod 755 to shell script files
set_permissions() {
    local dir="$1"
    find "$dir" -type f -name '*.sh' -exec chmod 755 {} \;
}

# Main script
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory."
    exit 1
fi

echo "Setting permissions to 755 for shell script files in '$directory' and its subdirectories..."
set_permissions "$directory"
echo "Done!"
