#!/bin/bash

# فایل داده شده حاوی نام کاربری و رمز عبور است
input_file="/root/ssh-useradd-options/grouply-create-users/accounts.txt"
output_file="telegram-output.txt"

# بررسی وجود فایل خروجی و در صورت نبود ایجاد آن
if [ ! -f "$output_file" ]; then
    touch "$output_file"
fi

# خواندن فایل و قرار دادن نام کاربری و رمز عبور
while read -r line; do
    username=$(echo "$line" | cut -d':' -f1)
    password=$(echo "$line" | cut -d':' -f2)
    echo "Username: \`$username\`! Password: \`$password\`!" | tee -a "$output_file"
done < "$input_file"


