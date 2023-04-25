#!/bin/bash

# Date today to year-month-day format
today=$(date +%Y-%m-%d)

# Folder name related to backup
backup_dir="backup_$today"

# Backup Zip Path
backup_file="$backup_dir.tar.gz"

# Main Folder
main_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure the user is used with sudo access
if [ $(id -u) -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# Back up old directory
echo "Creating backup of old directory..."
tar -czvf $backup_file $main_dir

# Delete old directory
echo "Removing old directory..."
rm -rf $main_dir

# Update from GitHub
echo "Cloning new version from Github..."
git clone https://github.com/prihac/ssh-useradd-options.git $main_dir

# Check for successful updates
if [ $? -eq 0 ]; then
    echo "Update was successful!"
    # Delete old version support file after one week
    echo "Removing backup file in one week..."
    echo "sudo rm -rf $backup_dir" | at now + 1 week
else
    echo "Update failed"
fi
exit 0
