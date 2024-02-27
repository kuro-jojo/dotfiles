#!/bin/bash

# Check if the file exists
if [ -f installed_packages.txt ]; then
    # Read the list of packages and reinstall them
   while read -r package _; do
        sudo apt-get install --reinstall "$package"
    done < installed_packages.txt
else
    echo "The file 'installed_packages.txt' does not exist."
fi
