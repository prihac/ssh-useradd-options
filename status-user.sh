#!/bin/bash
echo " ************ "
# Get username from user
read -p "Enter the username you want to Check Information: " username
echo
echo " ************ "
# Information user
chage -l "${username}"
echo " ************ "