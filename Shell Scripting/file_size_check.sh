#!/bin/bash

#Interactive File Size Check: Write a script that prompts the user for a file path and displays the file size in real-time as the user types (using backspace for corrections). Employ the read command and the du -s command to check size.

read -p "Enter file path: " file_path
echo "Here is the File Size for $file_path"
du -s $file_path