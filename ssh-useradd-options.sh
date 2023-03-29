#!/bin/bash

# Show Options
PS3='Please select your choice: '
options=("Create User" "Delete User" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create User")
            # Run Create user script
            sh ssh-useradd-options/create-user.sh
            ;;
        "Delete User")
            # Run Delete user script
            sh ssh-useradd-options/delete-user.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done