#!/bin/bash


#Define output file path
output_file="list-users.txt"
#Show only the last five users and save to output file

echo " ************ "
echo " Show only the last 100 users: "
cut -d: -f1 /etc/passwd | tail -n 100
echo " ************ "

echo ""
echo "Show only the last 100 users:"
cut -d: -f1 /etc/passwd | tail -n 100 > "$output_file"
echo "User list saved to $output_file"
echo ""

#exit 0
