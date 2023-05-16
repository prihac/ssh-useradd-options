#!/bin/bash

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "

# Get username from user
echo "\e[91m ************ \e[0m"
read -p "Enter the username you want to delete: " username
echo

# Delete user
pkill -u "${username}"
deluser "${username}"
echo "\e[91m ************ \e[0m"

echo " ************ "
exit 0
