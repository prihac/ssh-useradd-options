#!/bin/bash

# Show only the last five users
echo " ************ "
echo " Show only the last 100 users: "
cut -d: -f1 /etc/passwd | grep -Ev "root|daemon|bin|sys|sync|games|man|lp|mail|news|uucp|proxy|www-data|backup|list|irc|gnats|nobody|_apt|systemd-network|systemd-resolve|messagebus|systemd-timesync|sshd|stunnel4|privoxy" | tail -n 100
echo " ************ "
# Get username from user
read -p "Enter the username you want to Check Information: " username
echo
echo " ************ "
# Information user
chage -l "${username}"
echo " ************ "
exit 0