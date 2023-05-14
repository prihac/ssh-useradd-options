#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get total memory
total_mem=$(free -m | awk '/^Mem:/{print $2}')

# Get used memory
used_mem=$(free -m | awk '/^Mem:/{print $3}')

# Get free memory
free_mem=$(free -m | awk '/^Mem:/{print $4}')

# Print memory info with colors
echo -e "${BLUE}Total memory:${NC} ${total_mem} MB"
echo -e "${GREEN}Used memory:${NC} ${used_mem} MB"
echo -e "${RED}Free memory:${NC} ${free_mem} MB"
