#!/bin/bash

# Display current server settings
echo "Current server settings:"
echo "------------------------"
echo "net.ipv4.tcp_window_scaling = $(sysctl -n net.ipv4.tcp_window_scaling)"
echo "net.core.rmem_max = $(sysctl -n net.core.rmem_max)"
echo "net.core.wmem_max = $(sysctl -n net.core.wmem_max)"
echo "net.ipv4.tcp_rmem = $(sysctl -n net.ipv4.tcp_rmem)"
echo "net.ipv4.tcp_wmem = $(sysctl -n net.ipv4.tcp_wmem)"
echo "net.ipv4.tcp_low_latency = $(sysctl -n net.ipv4.tcp_low_latency)"
echo "net.ipv4.tcp_slow_start_after_idle = $(sysctl -n net.ipv4.tcp_slow_start_after_idle)"
echo

# Prompt user for changes
read -p "Do you want to modify the server settings? (y/n): " choice

if [[ $choice == "y" || $choice == "Y" ]]; then
    # Prompt user for new values
    read -p "Enter the new value for net.ipv4.tcp_window_scaling: " tcp_window_scaling
    read -p "Enter the new value for net.core.rmem_max: " rmem_max
    read -p "Enter the new value for net.core.wmem_max: " wmem_max
    read -p "Enter the new value for net.ipv4.tcp_rmem (format: min default max): " tcp_rmem
    read -p "Enter the new value for net.ipv4.tcp_wmem (format: min default max): " tcp_wmem
    read -p "Enter the new value for net.ipv4.tcp_low_latency: " tcp_low_latency
    read -p "Enter the new value for net.ipv4.tcp_slow_start_after_idle: " tcp_slow_start_after_idle

    # Apply new settings
    sudo sysctl -w net.ipv4.tcp_window_scaling=$tcp_window_scaling
    sudo sysctl -w net.core.rmem_max=$rmem_max
    sudo sysctl -w net.core.wmem_max=$wmem_max
    sudo sysctl -w net.ipv4.tcp_rmem="$tcp_rmem"
    sudo sysctl -w net.ipv4.tcp_wmem="$tcp_wmem"
    sudo sysctl -w net.ipv4.tcp_low_latency=$tcp_low_latency
    sudo sysctl -w net.ipv4.tcp_slow_start_after_idle=$tcp_slow_start_after_idle

    echo "Server settings have been updated."
else
    echo "No changes were made to the server settings."
fi
