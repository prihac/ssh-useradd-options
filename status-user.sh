#!/bin/bash
echo " ************ "
# Get username from user
read -p "Enter the username you want to delete: " username
echo
echo " ************ "
# Information user
chage -l "${username}"
echo " ************ "