#!/bin/bash

#Develop a shell script that encrypts and decrypts files using symmetric encryption algorithms (e.g., AES). Ensure that the script prompts the user for a passphrase and supports options for both encryption and decryption.

encrypt()
{
    OUTPUT_FILE="${FILE}.enc"
    openssl enc -aes-256-cbc -salt -in "$FILE" -out "$OUTPUT_FILE" -pass pass:"$PASSPHRASE"
    if [[ $? -eq 0 ]]; then
        echo "Encryption successful: $OUTPUT_FILE"
    else
        echo "Encryption failed."
    fi
}

decrypt()
{
    OUTPUT_FILE="${FILE%.enc}.dec"
    openssl enc -d -aes-256-cbc -in "$FILE" -out "$OUTPUT_FILE" -pass pass:"$PASSPHRASE"
    if [[ $? -eq 0 ]]; then
        echo "Decryption successful: $OUTPUT_FILE"
    else
        echo "Decryption failed. Possible wrong passphrase or corrupted file."
    fi
}

ask_for_passphrase()
{
        read -s -p "Enter passphrase: " PASSPHRASE
echo
read -s -p "Confirm passphrase: " PASSPHRASE_CONFIRM
echo
if [[ "$PASSPHRASE" != "$PASSPHRASE_CONFIRM" ]]; then
    echo "Error: Passphrases do not match."
    exit 1
fi
}


FILE=$1

if [ -z $1 ]
then
        echo "Please provide File name as argment to the script."
        exit 1
fi

while true; do
echo "=============================="
echo "File Encryption/Decrption Tool"
echo "=============================="
echo "1. Encryption"
echo "2. Decryption"
echo "3. Exit"
echo "=============================="
read -p "Choose an option [1-3]: " choice

case $choice in
1)
        ask_for_passphrase
        encrypt;;
2)
        ask_for_passphrase
        decrypt;;
3)
        exit 0;;
*)
        echo "Invalid Option";;
esac
done
