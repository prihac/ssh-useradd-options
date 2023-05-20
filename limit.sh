#!/bin/bash

read -p "لطفا نام کاربری را وارد کنید: " username
read -p "لطفا تعداد حداکثر اتصالات فعال را وارد کنید: " max_connections

if [ -z "$username" ] || [ -z "$max_connections" ]; then
    echo "لطفا هر دو فیلد را پر کنید."
    exit 1
fi

if ! id "$username" &>/dev/null; then
    echo "کاربر $username وجود ندارد."
    exit 1
fi

if ! [[ "$max_connections" =~ ^[0-9]+$ ]]; then
    echo "تعداد حداکثر اتصالات فعال باید عدد باشد."
    exit 1
fi

existing_limit=$(grep "^$username hard maxlogins" /etc/security/limits.conf)

if [ -n "$existing_limit" ]; then
    echo "محدودیت قبلی برای کاربر $username: $existing_limit"
    read -p "آیا مایلید که محدودیت جدید جایگزین شود؟ (y/n): " replace_limit
    if [ "$replace_limit" == "y" ]; then
        sed -i "/^$username hard maxlogins/d" /etc/security/limits.conf
        echo "$username hard maxlogins $max_connections" >> /etc/security/limits.conf
        echo "محدودیت جدید برای کاربر $username با موفقیت اعمال شد."
    else
        echo "محدودیت جدید اعمال نشد."
    fi
else
    echo "$username hard maxlogins $max_connections" >> /etc/security/limits.conf
    echo "محدودیت برای کاربر $username با موفقیت اعمال شد."
fi

echo "لیست کاربران محدود:"
grep 'maxlogins' /etc/security/limits.conf | awk '{print $1, $4}'
