#!/bin/bash

interface=$(ifconfig -a | grep -o -E '^([[:alnum:]]+)')

for i in $interface
do
    if [[ $i != "docker0" ]]; then
        echo "Interface $i found, running iftop on it..."
        sudo iftop -i $i
    fi
done

echo "Exiting script..."
