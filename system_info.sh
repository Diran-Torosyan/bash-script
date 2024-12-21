#!/bin/bash

# Check the user info
username=$(whoami)
echo "Current user: $username"

# Check the disk usage
df -h

# Disk space alert
threshold=90
current_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$current_usage" -ge "$threshold" ]; then
    echo "Disk space is running low"
    echo "Executing disk cleanup"
    du -sh /var/log/*
    rm -rf /var/log/*
else
    echo "Disk space is okay"
    echo "Disk space is currently at $current_usage%"
fi

# Check the system info
uname -a

# Check which processes are running
ps aux

# Check for internet connection
ping -c 5 google.com





