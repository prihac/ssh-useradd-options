#!/bin/bash

# Get username from user
read -p "Enter username: " username
echo
# Get password from user
read -p "Enter password: " password
echo

# Get expiration date from user
read -p "Enter number of days until account expiration: " expiration_days
expiration_date=$(date -d "+${expiration_days} days" +%Y-%m-%d)

# Get number of allowed logins from user
read -p "Enter number of allowed logins: " max_logins

# Create user with specified options
useradd -e "${expiration_date}" -f "${expiration_days}" -p "$(openssl passwd -1 "${password}")" -s /bin/false -M -N -l "${username}"

# Modify warning days for password expiration to 100
chage -W 100 "${username}"

# Create or update device tracking file
devices_file="/root/ssh-useradd-options/device_tracking.txt"

if [ ! -f "$devices_file" ]; then
  touch "$devices_file"
fi

# Check if the user already has devices connected
devices=$(grep -E "^${username}:" "$devices_file" | cut -d: -f2)
device_count=$(echo "$devices" | wc -w)

if [ $device_count -ge $max_logins ]; then
  echo "User $username already has the maximum number of devices connected."
  exit 1
fi

# Allow another user to connect with two devices
if [ $device_count -eq 1 ]; then
  read -p "Enter the username of the user to allow two devices: " two_devices_user

  # Check if the specified user exists
  if ! id "$two_devices_user" >/dev/null 2>&1; then
    echo "User $two_devices_user does not exist."
    exit 1
  fi

  # Check if the specified user already has two devices connected
  two_devices=$(grep -E "^${two_devices_user}:" "$devices_file" | cut -d: -f2)
  two_device_count=$(echo "$two_devices" | wc -w)

  if [ $two_device_count -eq 2 ]; then
    echo "User $two_devices_user already has two devices connected."
    exit 1
  fi

  # Allow the specified user to have two devices
  if [ -z "$two_devices" ]; then
    sed -i "s/^${username}:/&1:/" "$devices_file"
  else
    sed -i "s/^${username}:${devices}/${username}:${devices} ${two_devices}/" "$devices_file"
  fi
fi

# Update the device tracking file for the current user
if [ -z "$devices" ]; then
  echo "${username}:1" >> "$devices_file"
else
  sed -i "s/^${username}:${devices}/${username}:$((device_count + 1))/" "$devices_file"
fi

# Show only the last ten users except system users
echo -e "\e[91m ************ \e[0m"
echo " Show only the last ten users except system users: "
cut -d: -f1 /etc/passwd | grep -Ev "root|daemon|bin|sys|sync|games|man|lp|mail|news|uucp|proxy|www-data|backup|list|irc|gnats|nobody|_apt|systemd-network|systemd-resolve|messagebus|systemd-timesync|sshd|stunnel4|privoxy" | tail -n 10
echo -e "\e[91m ************ \e[0m"
