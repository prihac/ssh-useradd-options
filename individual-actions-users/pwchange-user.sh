#!/bin/bash

# Read the username from input
read -p "Enter the username:" username

# Read the new password from input (without displaying)
read -s -p "Enter the new password:" password

# Ask if the user wants to view the password
read -p "Do you want to view the password? (yes/no): " view_password

# Check the user's response
if [ "$view_password" == "yes" ]; then

# Print the username and new password
echo "Username: $username"
echo "Password: $password"
fi

# Change the password using the passwd command
echo "$username:$password" | chpasswd

# Print a success message for password change
echo "Password has been changed"
