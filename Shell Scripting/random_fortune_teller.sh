#!/bin/bash

# Array of pre-defined fortune messages
fortunes=(
    "A journey of a thousand miles begins with a single step."
    "The early bird catches the worm."
    "Believe you can and you're halfway there."
    "The best way to predict the future is to create it."
    "You will have a great day today."
    "Don't worry about failures, worry about the chances you miss when you don't even try."
    "The only way to do great work is to love what you do."
    "Good things come to those who wait, but better things come to those who go out and get them."
)

while true; do
    num_fortunes=${#fortunes[@]}

    random_index=$(( RANDOM % num_fortunes ))

    # Get the random fortune message
    fortune_message="${fortunes[$random_index]}"

    echo "--- Your Fortune ---"
    echo "$fortune_message"
    echo "--------------------"

    # Wait for a few seconds before displaying the next fortune
    sleep 5
done
