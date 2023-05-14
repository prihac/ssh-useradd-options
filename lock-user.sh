#!/bin/bash

# Show only the last five users
echo "************"
echo "Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo "************"

# Get username from user
echo "\e[91m************\e[0m"
read -p "Enter the username you want to lock/unlock: " username
echo

# Check if user exists
if id "$username" >/dev/null 2>&1; then
    # Check if user is currently locked
    if sudo passwd -S "$username" | grep -q ' LK '; then
        echo "User is currently locked. Do you want to unlock the user? (y/n)"
        read unlock_user
        if [[ "$unlock_user" == "y" ]]; then
            sudo passwd -u "$username"
            echo "User '$username' has been unlocked."
        else
            echo "Aborting unlocking of user."
            exit 1
        fi
    else
        echo "User is currently unlocked. Do you want to lock the user? (y/n)"
        read lock_user
        if [[ "$lock_user" == "y" ]]; then
            sudo passwd -l "$username"
            echo "User '$username' has been locked."
        else
            echo "Aborting locking of user."
            exit 1
        fi
    fi
else
    echo "User '$username' does not exist."
    exit 1
fi

# Show only the last five users
echo "************"
echo "Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo "************"
exit 0
