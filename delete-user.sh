#!/bin/bash

# Show only the last ten users
echo " ************ "
echo " Show only the last ten users: "
cut -d: -f1 /etc/passwd | tail -n 10
echo " ************ "

# Get username from user
read -p "Enter the username you want to delete: " username
echo

# Delete user
deluser "${username}"

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "