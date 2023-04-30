#!/bin/bash

# Define output file paths
list_users_file="list-users.txt"
list_users_nodir_file="list-users-nodir.txt"
list_users_after_testsh_file="list-users-aftertestsh.txt"

# Show only the last 100 users and save to output file
echo "************"
echo "Show only the last 100 users:"
cut -d: -f1 /etc/passwd | tail -n 100 > "$list_users_file"
echo "User list saved to $list_users_file"
echo ""

# Get testsh user creation time
testsh_time=$(sudo grep testsh /etc/passwd | cut -d: -f3)

# Get all users who were created after testsh and save to output file
echo "************"
echo "Show users created after user 'testsh':"
cut -d: -f1 /etc/passwd | awk -v t="$testsh_time" -F: '$3 > t {print}' > "$list_users_after_testsh_file"
echo "User list saved to $list_users_after_testsh_file"
echo ""

# Get all users who do not have access to a directory and save to output file
echo "************"
echo "Show users who do not have access to a directory:"
cut -d: -f1,6 /etc/passwd | awk -F: '{if(system("sudo -u "$1" ls "$6" >/dev/null 2>&1") != 0) {print $1}}' > "$list_users_nodir_file"
echo "User list saved to $list_users_nodir_file"
echo ""

#exit 0
