#!/bin/bash

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "

# Get username from user
read -p "Enter the username you want to delete: " username
echo

# Delete user
deluser "${username}"
echo -e "\e[91m ************ \e[0m"

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "
exit 0