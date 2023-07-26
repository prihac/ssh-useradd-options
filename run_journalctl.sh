#!/bin/bash

# Function to execute journalctl for all logs
execute_journalctl_all() {
    journalctl _UID=$(id -u $1)
}

# Function to execute journalctl for logs with "error"
execute_journalctl_error() {
    journalctl _UID=$(id -u $1) | grep "error"
}

# Display the menu options
echo "Menu:"
echo "1. Execute journalctl for all logs"
echo "2. Execute journalctl for logs with 'error'"
echo "3. Execute journalctl for multiple usernames"
read -p "Please enter your choice (1, 2, or 3): " choice

case $choice in
    1)
        read -p "Please enter the username: " username
        execute_journalctl_all $username
        ;;
    2)
        read -p "Please enter the username: " username
        execute_journalctl_error $username
        ;;
    3)
        read -p "Please enter the list of usernames separated by spaces: " usernames
        for user in $usernames; do
            echo "Journalctl output for user $user:"
            execute_journalctl_all $user
            echo "-------------------------------------------------"
        done
        ;;
    *)
        echo "Invalid choice. Please enter either 1, 2, or 3."
        ;;
esac
