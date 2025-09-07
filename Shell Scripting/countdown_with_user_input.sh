#!/bin/bash

#Countdown with User Input: Write a script that asks the user for a duration in seconds and displays a countdown timer that updates every second until it reaches zero. Combine a loop with the sleep command for real-time updates.

read -p "Enter duration in seconds: " duration_in_seconds

until [ $duration_in_seconds -eq 0 ]
do
echo "Countdown: $duration_in_seconds"
sleep 1
clear
duration_in_seconds=$(( $duration_in_seconds - 1 ))
done
echo "Countdown Completed !!!"