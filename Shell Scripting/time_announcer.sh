#!/bin/bash

#Time Announcer: Write a script that displays a personalized greeting along with the current time every minute. For example, "Good morning, Alice! It's Wednesday, 27 March 2024 11:15 AM." (Use date and a loop to update every minute).

while true
do
echo "Good morning, Alice! It's `date`"
sleep 60
done