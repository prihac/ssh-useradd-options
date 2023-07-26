#!/bin/bash

# Prompt the user for the username
read -p "Please enter the username: " username

# Execute the desired command using journalctl
journalctl _UID=$(id -u $username)
