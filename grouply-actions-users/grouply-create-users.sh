#!/bin/bash

# Check accounts-grouply-create.txt available file
if [ ! -f "accounts-grouply-create.txt" ]; then
  echo "Error: File 'accounts-grouply-create.txt' not found!"
  exit 1
fi

# Check accounts-grouply-create.txt correct file
while IFS=: read -r username password; do
  if [[ -z $username || -z $password ]]; then
    echo "Error: Invalid format for line '$username:$password' in 'accounts-grouply-create.txt' file!"
    exit 1
  fi
  ...
done < accounts-grouply-create.txt

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
    # Create user with default password if password is not specified in accounts-grouply-create.txt
    if [ -z "$password" ]; then
      password="$default_password"
    fi

    # Create user
    useradd -m -s /bin/false "$username"

    # Set password
    echo "$username:$password" | chpasswd

    # Set password expiration warning
    chage -W 100 "$username"

    echo "User $username created with password $password"
  fi

done < accounts-grouply-create.txt
