#!/bin/bash

# Function to execute journalctl for all logs
execute_journalctl_all() {
    journalctl _UID=$(id -u $username)
}

# Function to execute journalctl for logs with "error"
execute_journalctl_error() {
    journalctl _UID=$(id -u $username) | grep "error"
}

# Display the menu options
echo "Menu:"
echo "1. Execute journalctl for all logs"
echo "2. Execute journalctl for logs with 'error'"
read -p "Please enter your choice (1 or 2): " choice

# Prompt the user for the username
read -p "Please enter the username: " username

# Perform action based on the user's choice
case $choice in
    1)
        execute_journalctl_all
        ;;
    2)
        execute_journalctl_error
        ;;
    *)
        echo "Invalid choice. Please enter either 1 or 2."
        ;;
esac
