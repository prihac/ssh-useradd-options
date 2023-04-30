#!/bin/bash

# Define output file paths
user_list="list-users.txt"
user_list_nodir="list-users-nodir.txt"
user_list_after_testsh="list-users-aftertestsh.txt"

# Show only the last 100 users and save to user_list file
echo "Show only the last 100 users:"
cut -d: -f1 /etc/passwd | tail -n 100 > "$user_list"
echo "User list saved to $user_list"

# Filter out system users and save to user_list_nodir file
echo "Filter out system users:"
awk -F: '{ if ($6 == "/usr/sbin/nologin" || $6 == "/bin/false" || $6 == "/nonexistent") { print $1 } }' /etc/passwd | grep -vE '^(root|daemon|bin|sys|sync|games|man|lp|mail|news|uucp|proxy|www-data|backup|list|irc|gnats|nobody|_apt|systemd-network|systemd-resolve|messagebus|systemd-timesync|sshd)$' > "$user_list_nodir"
echo "User list saved to $user_list_nodir"

# List all users created after testsh user and save to user_list_after_testsh file
echo "List all users created after testsh user:"
last_created_user=$(grep -oP 'testsh:\K[^:]*' /etc/passwd)
grep -E "^([^:]*:){3}$last_created_user" /etc/passwd | awk -F: '{print $1}' | grep -v testsh > "$user_list_after_testsh"
echo "User list saved to $user_list_after_testsh"
