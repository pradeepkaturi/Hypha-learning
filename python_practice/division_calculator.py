#!/usr/bin/python3

# script that asks for two numbers from the user and attempts to divide the first by the second. 
# Handle any potential exceptions (e.g., division by zero, input that isn't a number) gracefully, informing the user of the error.

try:
    first_number = int(input("Enter first number: "))
    second_number = int(input("enter second number: "))
    division = first_number/second_number
    print(division)
except (ValueError, ZeroDivisionError, TypeError) as e :
    print(f"Caught an exception", e)