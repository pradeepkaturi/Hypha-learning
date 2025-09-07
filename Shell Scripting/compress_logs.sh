#!/bin/bash

#Set up a cron job to compress system logs daily at 2:30 AM, delete compressed log files older than 30 days, and email a report of successful and failed compressions to the system administrator.

DATE=`date +'%d%m%Y'`
REPORT="logs_compression_report_${DATE}.txt"

#command to compress the log files in the current directory
tar -czvf archive_$DATE.tar.gz *.log > $REPORT
if [ $? -eq 0 ]
then
echo "Hi,Suppressing Logs was Successful and attached is the report." | mail -s "LOGS COMPRESSION - SUCCESS - $DATE" -a $REPORT [pradeepkaturi@gmail.com](mailto:pradeepkaturi@gmail.com)
else
echo "Hi,Suppressing Logs was Failed and attached is the report." | mail -s "LOGS COMPRESSION - FAILED - $DATE" -a $REPORT [pradeepkaturi@gmail.com](mailto:pradeepkaturi@gmail.com)
fi

#command to delete the compressed files(*.gz) which are older than 30 days
find . -type f -name "*.gz" -mtime +30 -print -delete;