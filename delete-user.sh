#!/bin/bash

# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "

if id "${username}" >/dev/null 2>&1; then
  deluser "${username}"
else
  echo "User ${username} does not exist"
fi


# Show only the last five users
echo " ************ "
echo " Show only the last five users: "
cut -d: -f1 /etc/passwd | tail -n 5
echo " ************ "
exit 0