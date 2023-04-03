#!/bin/bash
echo " ************ "

# Check if nethogs is installed
if ! dpkg -s nethogs >/dev/null 2>&1; then
    echo "nethogs is not installed, installing it now..."
    sudo apt-get update
    sudo apt-get install nethogs -y
fi

# Online User
sudo nethogs

echo " ************ "
