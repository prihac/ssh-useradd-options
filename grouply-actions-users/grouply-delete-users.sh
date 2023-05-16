#!/bin/bash

# Check accounts-grouply-delete.txt available file
if [ ! -f "accounts-grouply-delete.txt" ]; then
  echo "Error: File 'accounts-grouply-delete.txt' not found!"
  exit 1
fi

# Check accounts-grouply-delete.txt correct file
while IFS=: read -r username _; do
  if [ -z "$username" ]; then
    echo "Error: Invalid format for line '$username' in 'accounts-grouply-delete.txt' file!"
    exit 1
  fi
done < accounts-grouply-delete.txt

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

done < accounts-grouply-delete.txt
