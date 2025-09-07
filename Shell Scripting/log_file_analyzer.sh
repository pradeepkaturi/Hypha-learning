#!/bin/bash

#Develop a script that analyzes a specified log file (e.g., Apache or Nginx access log) and extracts information such as the most frequent IP addresses and request URLs. The script should also identify any error codes (like 404 or 500) and count their occurrences.

log_file=$1
echo >  ip_address_count.txt

for IP in `cat $log_file | awk '{print $1}' | sort | uniq`
do
        echo "`cat $log_file | grep -w "$IP" | wc -l` - $IP" >> ip_address_count.txt
done
echo
echo "Below are the top most frequent IP's with the URLS extracted from the $log_file:"
echo "========================================"
echo "No.of Entries - IP Address"
cat ip_address_count.txt | sort -nr | head -5
echo "========================================="
echo
for IP in `cat ip_address_count.txt | sort -nr | head -5 | awk '{print $3}'`
do
        echo $IP
        echo "================="
        cat sample_apache.log | awk '{print $11}' | grep "http://" | sort | uniq | head -5
        echo
done
echo
echo "Here are the Error Codes and no of occurances:"
echo "========================================="
echo "Error 404: `cat $log_file | awk '{print $9}' | grep 404 | wc -l`
echo "Error 500: `cat $log_file | awk '{print $9}' | grep 500 | wc -l`
echo

