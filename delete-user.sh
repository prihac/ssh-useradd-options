#!/bin/bash

# Show User Info
echo " ************ "
echo " Show only the last ten users: "
cut -d: -f1 /etc/passwd | tail -n 10
echo " ************ "

# Get username from user
read -p "Enter username: " username
echo

# Delete user
deluser "${username}"

# Get username from user
read -p "Enter username: " username

# Show User Info
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "