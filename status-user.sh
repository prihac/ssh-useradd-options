#!/bin/bash

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "
# Get username from user
read -p "Enter the username you want to Check Information: " username
echo
echo " ************ "
# Information user
chage -l "${username}"
echo " ************ "