#!/bin/bash

# Remove script
rm -rf ssh-useradd-options

# Check for successful Uninstall
if [ $? -eq 0 ]; then
    echo "Uninstall was successful!"
else
    echo "Update failed"