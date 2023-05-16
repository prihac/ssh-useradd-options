#!/bin/bash

# Read the username from user input
read -p "Please enter the username you want to extend: " username

# Read the expiration duration from user input
echo "Please select the expiration duration:"
echo "1) 1 Month"
echo "2) 3 Months"
echo "3) 6 Months"
echo "4) Custom Day"
read -p "Enter your choice (enter the option number): " choice

case $choice in
  1)
    duration="+1 month"
    ;;
  2)
    duration="+3 months"
    ;;
  3)
    duration="+6 months"
    ;;
  4)
    read -p "Please enter the number of days you want to extend: " custom_days
    duration="+$custom_days days"
    ;;
  *)
    echo "Invalid option. Exiting the script."
    exit 1
    ;;
esac

# Set the account expiration date
expiration_date=$(date -d "$duration" +%Y-%m-%d)
chage -E "$expiration_date" -W 1 "$username"

# Display the success message
echo "Account $username has been successfully extended."
echo "Account details:"
chage -l "$username"
