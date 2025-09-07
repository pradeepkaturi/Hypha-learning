#!/bin/bash

#Objective: Create a script that audits user accounts and file permissions in a system. The script should list all users, their last login time, and check for any files in sensitive directories (like /etc or /var) with permissions that are too permissive (e.g., world-writable files).

echo "Here are the list of users in the system with their Last Login Time:"
echo "=================================================================="
for usersdf in `cat /etc/passwd | cut -d ":" -f1`
do
        echo "$usersdf - `last $user | grep -v "still" | head -1 |awk '{print $4,$5,$6,$7}'`"
done
echo
echo "List of Files that are world-writable under /var /etc:"
echo "======================================================="
echo "Count: `sudo find /etc /var -type f -perm /0002 -ls | wc -l`"
sudo find /etc /var -type f -perm /0002 -ls
