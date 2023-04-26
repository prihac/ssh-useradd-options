#!/bin/bash

interface=$(ifconfig -a | grep -o -E '^([[:alnum:]]+)')

for i in $interface
do
    if [[ $i != "docker0" ]]; then
        bandwidth=$(sudo iftop -i $i)
        echo "Bandwidth usage for interface $i :"
        echo "$bandwidth"
    fi
done