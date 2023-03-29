#!/bin/bash

# Get username from user
read -p "Enter username: " username

# Get password from user
read -p "Enter password: " -s password
echo

# Get expiration date from user
read -p "Enter number of days until account expiration: " expiration_days
expiration_date=$(date -d "+${expiration_days} days" +%Y-%m-%d)

# Get number of allowed logins from user
read -p "Enter number of allowed logins: " max_logins

# Create user with specified options
useradd -e "${expiration_date}" -f "${expiration_days}" -p "$(openssl passwd -1 "${password}")" -l "${max_logins}"
