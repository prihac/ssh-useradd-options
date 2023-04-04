#!/bin/bash

# Ask for the path of the users.txt file
read -p "Please enter the path of the accounts.txt file: " file_path

# Check if the file path is empty
if [ -z "$file_path" ]; then
  echo "The file path cannot be empty."
  exit 1
fi

# Check if the file exists
if test -f "$file_path"; then
  echo "Connected to accounts.txt database."
else
  echo "The file does not exist."
  exit 1
fi

# Ask for the expiration time in days
read -p "Please enter the expiration time in days: " expiration_time

# Calculate the expiration date
expiration_date=$(date -d "+${expiration_time} days" +%Y-%m-%d)

# Display the expiration date and ask for confirmation
echo "The expiration date for the accounts will be ${expiration_date}."
read -p "Do you confirm? (y/n) " confirm

if [ "$confirm" != "y" ]; then
  echo "Aborted."
  exit 0
fi

# Loop over the users in the file
while read user; do
  # Set the expiration date for the user account
  sudo chage -E ${expiration_date} ${user}

  # Check if the command was successful
  if [ "$?" -eq "0" ]; then
    echo "The account for ${user} has been successfully updated."
    echo "${expiration_date}" >> ${user}_expiration_date.txt
  else
    echo "Failed to update the account for ${user}."
  fi
done < ${file_path}

