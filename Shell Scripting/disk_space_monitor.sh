#!/bin/bash

#Free Disk Space Monitor: Write a script that checks the free disk space on a specific partition  (e.g., /) and displays the available space in megabytes (MB) or gigabytes (GB). Update the information periodically (e.g., every minute) using a loop.

while true
do
        clear
        echo "Free Disk Space details of $1 partition as on `date`"
        echo "============================"
        echo "Filesystem Avail"
        df -h | grep "$1" | awk '{print $1,$4}' | sed -e "s/G/ GB/" | sed -e "s/M/ MB/" | sed -e "s/K/ KB/"
        echo "============================"
        echo "Refreshes every minute ...."
        sleep 60
done
