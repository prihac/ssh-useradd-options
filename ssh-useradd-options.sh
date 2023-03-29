#!/bin/bash

echo " ************ "
# Show Options
PS3='Please select your choice: '
options=("Create User" "Delete User" "Status User" "Update Script" "Uninstall Script" "Quit")
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
        "Status User")
            # Run Status user script
            sh ssh-useradd-options/status-user.sh
            ;;			
		"Update Script")
            # Run Update script
            sh ssh-useradd-options/update-script.sh
            ;;	
		"Uninstall Script")
            # Run Uninstall script
            sh ssh-useradd-options/uninstall-script.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
echo " ************ "