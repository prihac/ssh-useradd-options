#!/bin/bash

# Get username from user
read -p "Enter username: " username
echo

# Delete user
deluser "${username}"

# Get username from user
read -p "Enter username: " username

# Show User Info
chage -l "${username}"