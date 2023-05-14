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

# Check if user is currently logged in
if w | grep -q "$username"; then
  echo "User is currently logged in. Do you want to force logout and delete the user? (y/n)"
  read force_logout
  if [[ "$force_logout" == "y" ]]; then
    sudo usermod -L "$username"  
    pkill -KILL -u "$username"
  else
    echo "Aborting deletion of user."
    exit 1
  fi
fi

# Delete user
deluser "${username}"
echo "\e[91m ************ \e[0m"

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "
exit 0
