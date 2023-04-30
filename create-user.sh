#!/bin/bash

# Get username from user
read -p "Enter username: " username
echo
# Get password from user
read -p "Enter password: " password
echo

# Get expiration date from user
read -p "Enter number of days until account expiration: " expiration_days
expiration_date=$(date -d "+${expiration_days} days" +%Y-%m-%d)

# Get number of allowed logins from user
read -p "Enter number of allowed logins: " max_logins

# Create user with specified options
useradd -e "${expiration_date}" -f "${expiration_days}" -p "$(openssl passwd -1 "${password}")" -s /bin/false -M -N -l "${username}"

# Modify warning days for password expiration to 100
chage -W 100 "${username}"

# Show only the last five users
echo "\e[91m ************ \e[0m"
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo "\e[91m ************ \e[0m"

exit 0
