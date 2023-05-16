#!/bin/bash


if [ -f /etc/debian_version ]; then
	UIDN=1000
elif [ -f /etc/redhat-release ]; then
	UIDN=500
else
	UIDN=500
fi

echo " "
echo " "
echo "===========================================";
echo " "
echo "-----------------------------------"
echo "        USER ACCOUNTS LIST         "
echo "-----------------------------------"
echo "[USERNAME]   -   [DATE EXPIRED]  "
echo " "
while read checklist
do
        ACCOUNT="$(echo $checklist | cut -d: -f1)"
        ID="$(echo $checklist | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $ACCOUNT | grep "Account expires" | awk -F": " '{print $2}')"
        if [ $ID -ge $UIDN ]; then
	   #if [[ $ID -ge $UIDN ]]; then
        printf "%-17s %2s\n" "$ACCOUNT" "$exp"
        fi
done < /etc/passwd
AMOUNT="$(awk -F: '$3 >= '$UIDN' && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------------"
echo "Number Of User Accounts: $AMOUNT USERS"
echo "-------------------------------------"
echo " "
echo "===========================================";
echo " ";
echo " ";
