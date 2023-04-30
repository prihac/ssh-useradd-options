#!/bin/bash

# Check accounts.txt available file
if [ ! -f "accounts.txt" ]; then
  echo "Error: File 'accounts.txt' not found!"
  exit 1
fi

# Check accounts.txt correct file
while IFS=: read -r username _; do
  if [ -z "$username" ]; then
    echo "Error: Invalid format for line '$username' in 'accounts.txt' file!"
    exit 1
  fi
done < accounts.txt

# Read accounts from file and delete users
while read account; do
  # Extract username
  username=$(echo $account | cut -d: -f1)

  # Check if user exists
  if id "$username" >/dev/null 2>&1; then
    # Delete user
    userdel -r "$username"

    echo "User $username deleted"
  else
    echo "User $username does not exist"
  fi

done < accounts.txt
