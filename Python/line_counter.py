#!/usr/bin/python3

# Python script to accept a filename as a command-line argument, count the number of lines in the file, 
# and print the count.

try:
    file_path = input ("Enter File Name: ")
    print(f"Entered File Path was: ", file_path)
    with open(file_path, 'r') as fp:
        lines = len(fp.readlines())
    print('Total number of lines:', lines)
except FileNotFoundError:
    print("Error: File Not found or Cannot read the file name")