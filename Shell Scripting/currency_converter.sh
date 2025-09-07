#!/bin/bash

#Interactive Currency Converter: Write a script that prompts the user for an amount in their local currency and displays the equivalent value in another currency. Use a loop for continuous input and consider APIs for real-time conversion rates (may require additional research).

read -p "Enter amount in Rupees: " amount
read -p "Enter Source Currency (Ex: INR): " source_currency
read -p "Enter Target Currency (EX: USD): " target_currency

conversion_result=`curl -s "https://v6.exchangerate-api.com/v6/3f4434b0132bb1204aef021e/pair/$source_currency/$target_currency/100"`
echo $conversion_result | grep error &> /dev/null
if [ $? -eq 0 ]
then
        echo "Error: Cannot convert amount due to $conversion_result"
else
        conversion_result=`echo "$conversion_result" | jq -r '.conversion_result'`
        echo "Amount of $amount $source_currency in $target_currency was: $conversion_result $target_currency"
fi