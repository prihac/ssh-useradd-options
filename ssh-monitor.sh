
#!/bin/bash

#Get the list of users from the system
users=($(cut -d: -f1 /etc/passwd))

#Loop through the users
for user in "${users[@]}"; do

# Check if the user has ssh connections
s1ssh="$(ps -u $user | grep -c sshd)"
if [[ $s1ssh -gt 0 ]]; then
tput setaf 3 ; tput bold ; printf ' %-35s%s\n' "$user" "$s1ssh" ; tput sgr0
fi
done
