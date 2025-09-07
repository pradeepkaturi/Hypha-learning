#!/bin/bash

#Simple File Change Monitor: Write a script that monitors a specific File for changes. If the File modification time changes, the script displays a message indicating the File has been modified. Use the stat command for comparisons.

File=$1
if [ -f $File ]
then
        last_modified_timestamp=`stat $File | grep "Modify" | awk '{print $2,$3}'`
        current_modified_timestamp=`stat $File | grep "Modify" | awk '{print $2,$3}'`
        while true
        do
                current_modified_timestamp=`stat $File | grep "Modify" | awk '{print $2,$3}'`
                if [ "$current_modified_timestamp" == "$last_modified_timestamp" ]
                then
                        echo "`date` - OK - $File not modified and the last modified was on $current_modified_timestamp"
                else
                        echo "`date` - CRITICAL - $File has been modified and the last modified was on $current_modified_timestamp"
                fi
                sleep 10
        done
else
        ls $File
fi
