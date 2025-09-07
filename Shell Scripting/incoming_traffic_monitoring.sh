#!/bin/bash

#Run a script every 5 minutes to collect network traffic statistics. If the incoming traffic exceeds a certain threshold for three consecutive checks, send an email alert to the network administrator

Alert_threshold=5

#Command to get the incoming traffic count
INC_TF_COUNT=`netstat -lntp | grep tcp | grep LISTEN | wc -l`
LOG_FILE="incoming_traffic_monitor.log"
check_attempt=1
until [ $check_attempt -gt 3  ]
do
if [ $INC_TF_COUNT -ge $Alert_threshold ]
then
echo "`date` - CRITICAL - Incoming Network Traffic Count was $INC_TF_COUNT - Check Attempt $check_attempt" | tee -a $LOG_FILE
if [ $check_attempt -eq 3 ]
then
echo "`date` - Reached max check attempts. Sending email to administrator.. " | tee -a $LOG_FILE
#echo "`date` - CRITICAL - Incoming Network Traffic Count was $INC_TF_COUNT" | mail -s "Incoming Network Traffic - CRITICAL" mailaddress
exit 0
fi
else
echo "`date` - OK - Incoming Network Traffic Count was $INC_TF_COUNT - Check Attempt $check_attempt" | tee -a $LOG_FILE
fi
sleep 5
((check_attempt++))
done