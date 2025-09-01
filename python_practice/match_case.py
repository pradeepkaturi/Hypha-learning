#!/usr/bin/python3

#script that prompts the user to enter commands ('start', 'stop', 'exit'). 
# Use a match-case statement to execute different actions (print statements) for each command.

command = input("Enter Command: ")
match command:
    case 'start'|'START':
        print("Entered command is 'Start'")
    case 'stop'|'STOP':
        print("Entered command is 'Stop'")
    case 'exit'|'EXIT':
        print("Entered command is 'Exit")
    case _:
        print("Incorrect Choice") #default Choice