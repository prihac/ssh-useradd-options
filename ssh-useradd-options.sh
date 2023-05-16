#!/bin/bash

echo " ************ "
# Show Options
PS3='Please select your choice: '
options=("Create User" "Extend User" "Delete User" "Status User" "Update Script" "Uninstall Script" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create User")
            # Run Create user script
            sh /root/ssh-useradd-options/individual-actions-users/create-user.sh
            ;;
        "Extend User")
            # Run Extend user script
            sh /root/ssh-useradd-options/individual-actions-users/extended-user.sh
            ;;
        "Delete User")
            # Run Delete user script
            sh /root/ssh-useradd-options/individual-actions-users/delete-user.sh
            ;;
        "Status User")
            # Run Status user script
            sh /root/ssh-useradd-options/individual-actions-users/status-user.sh
            ;;
        "Online User")
            # Run Online user script
            sh /root/ssh-useradd-options/online-user.sh
            ;;
        "Network Interface")
            # Run Network Interface script
            sh /root/ssh-useradd-options/network_interface.sh
            ;;
        "Network Bandwidth")
            # Run Network Bandwidth script
            sh /root/ssh-useradd-options/network_bandwidth.sh
            ;;
        "Update Script")
            # Run Update script
            sh /root/ssh-useradd-options/update-script.sh
            ;;
        "Uninstall Script")
            # Run Uninstall script
            sh /root/ssh-useradd-options/uninstall-script.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
echo " ************ "