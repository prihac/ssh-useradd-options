#!/bin/bash

echo " ************ "
# Show Options
PS3='Please select your choice: '
options=("Create User" "Delete User" "Status User" "Online User" "Update Script" "Uninstall Script" "Quit" "SSH Monitor")
select opt in "${options[@]}"
do
    case $opt in
        "Create User")
            # Run Create user script
            sh /root/ssh-useradd-options/create-user.sh
            ;;
        "Delete User")
            # Run Delete user script
            sh /root/ssh-useradd-options/delete-user.sh
            ;;
        "Status User")
            # Run Status user script
            sh /root/ssh-useradd-options/status-user.sh
            ;;		
        "Online User")
            # Run Status user script
            sh /root/ssh-useradd-options/online-user.sh
            ;;				
		"Network Interface")
			sh /root/ssh-useradd-options/network_interface.sh
            ;;		
		"Network Bandwith")
			sh /root/ssh-useradd-options/network_bandwith.sh
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
		"SSH Monitor")
            # Run Uninstall script
            sh /root/ssh-useradd-options/ssh-monitor.sh
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
echo " ************ "