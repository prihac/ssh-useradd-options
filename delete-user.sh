#!/bin/bash

# Show User Info
cut -d: -f1 /etc/passwd | tail -n 5

# Get username from user
read -p "Enter username: " username
echo

# Delete user
deluser "${username}"

# Get username from user
read -p "Enter username: " username

# Show User Info
cut -d: -f1 /etc/passwd 