#!/bin/bash

# Function to delete files containing the phrase "Zone.Identifier" require a parameter for the directory
delete_zone_files() {
    local dir="$1"
    find "$dir" -type f -name '*Zone.Identifier*' -exec rm -f {} \;
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

echo "Deleting files containing 'Zone.Identifier' in '$directory' and its subdirectories..."
delete_zone_files "$directory"
echo "Done!"

