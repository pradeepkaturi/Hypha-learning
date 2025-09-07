#!/bin/bash

# Service Monitoring Script**: Develop a script that monitors critical system services (e.g., Apache, SSH, MySQL) and restarts them automatically if they are found to be down. Include logging functionality to record service status changes.

LOG_FILE="sshd_service_status.log"

while true
do
systemctl status sshd | grep "Active:" | grep "(running)" >/dev/null
if [ $? -eq 0 ]
then
echo "`date` - OK - SSH Service was Up & Running" | tee -a $LOG_FILE
else
echo "`date` - CRITICAL - SSH Service was NOT Running." | tee -a $LOG_FILE
echo "`date` - Restarting ssh service ..." | tee -a $LOG_FILE
echo "systemctl restart sshd" | tee -a $LOG_FILE
fi
sleep 10
done