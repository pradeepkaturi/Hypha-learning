#!/bin/bash

#System Uptime Monitor: Write a script that displays the system uptime and refreshes it every 5 seconds. Use the uptime command and a loop to achieve real-time updating.

while true
do
uptime
sleep 5
clear
done