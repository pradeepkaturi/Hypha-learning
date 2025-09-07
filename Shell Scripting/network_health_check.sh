#!/bin/bash

#Objective: Create a script that checks the network health of your server. It should ping a set of predefined IPs or domain names and report any failures along with the timestamp. The script should log this information and send an alert (e.g., via email) if any of the pings fail.

ip_list="google.com amazon.in test.com"
LOG="network_health_monitor.log"

for address in `echo $ip_list`
do
        #Command to ping the address and check for three replies and also timeout after 2 seconds if cannot ping
        ping $address -c 3 -W 2 &>/dev/null
        if [ $? -eq 0 ]
        then
                CONN_RESULT="`date` - OK - Ping Successful to Address($address)"
                echo $CONN_RESULT | tee -a $LOG
        else
                CONN_RESULT="`date` - CRITICAL - Ping Failed to Address($address)"
                echo $CONN_RESULT | tee -a $LOG
                #Command to print the ping result and send alert via email using mail command
                #echo $CONN_RESULT | mail -s "Network Health Check Failed !!!" pradeepkaturi@gmail.com
        fi
done
