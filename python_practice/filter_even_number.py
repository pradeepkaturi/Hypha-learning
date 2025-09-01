#!/usr/bin/python3

# Python script to accepts a list of numbers and returns a list of even numbers found in the input list. 
# Use this function in a script to filter a predefined list.

numbers_input = input ("Enter the list of numbers with spaces:")
list_of_strings = numbers_input.split()
print(list_of_strings)
list_of_numbers = list(map(int, list_of_strings))
for number in list_of_numbers:
    if number % 2 == 0:
        print(number, "even number")