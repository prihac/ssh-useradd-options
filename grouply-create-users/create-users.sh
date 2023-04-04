#!/bin/bash

# Check accounts.txt available file
if [ ! -f "accounts.txt" ]; then
  echo "Error: File 'accounts.txt' not found!"
  exit 1
fi
# Check accounts.txt correct file
while IFS=: read -r username password; do
  if [[ -z $username || -z $password ]]; then
    echo "Error: Invalid format for line '$username:$password' in 'accounts.txt' file!"
    exit 1
  fi
  ...
done < accounts.txt


# Define default password
default_password="PriH@cssw0rdHac"

# Read accounts from file
while read account; do
  # Extract username and password
  username=$(echo $account | cut -d: -f1)
  password=$(echo $account | cut -d: -f2)

  # Check if user already exists
  if id "$username" >/dev/null 2>&1; then
    echo "User $username already exists"
  else
    # Create user with default password if password is not specified in accounts.txt
    if [ -z "$password" ]; then
      password="$default_password"
    fi

    # Create user
    useradd -m -s /bin/false "$username"

    # Set password
    echo "$username:$password" | chpasswd

    echo "User $username created with password $password"
  fi

done < accounts.txt
