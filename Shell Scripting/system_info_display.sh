#!/bin/bash

#Simple System Info Display: Write a script that displays essential system information like the current user, hostname, and operating system version in real-time. Update the script to display this information periodically (e.g., every minute). (Use commands like whoami, hostname, and uname -r to retrieve the information).

echo "---------------------------"
echo "System Info:"
echo "---------------------------"
echo "Current User: $USER"
echo "Hostname:  `hostname -s`"
echo "Operating System: `uname -r`"
echo "---------------------------"
