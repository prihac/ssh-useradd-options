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

if id "${username}" >/dev/null 2>&1; then
  deluser "${username}"
else
  echo "User ${username} does not exist"
fi


# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "
exit 0