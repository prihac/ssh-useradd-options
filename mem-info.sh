#!/bin/bash

# Get total memory
total_mem=$(free -m | awk '/^Mem:/{print $2}')

# Get used memory
used_mem=$(free -m | awk '/^Mem:/{print $3}')

# Get free memory
free_mem=$(free -m | awk '/^Mem:/{print $4}')

echo "Total memory: $total_mem MB"
echo "Used memory: $used_mem MB"
echo "Free memory: $free_mem MB"
