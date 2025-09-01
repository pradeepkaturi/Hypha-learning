import os
os.system('cls')

#Raising Exception
a = 1
b = 0
class InvalidDenominationError(Exception):
    pass

if b == 0:
    raise InvalidDenominationError("Caught Exception")

#Break and Continue
# selected_number = int(input("Enter your number: "))
# numbers = [1, 2, 3, 4]
# for number in numbers:
#     if number == selected_number:
#         print(number)
#         break
#     else:
#         print(number)

#While Loop
# i = 1
# while i <= 5:
#     print(i)
#     i += 1

#Match Case
# print("""Menu Items:
#     1.Nagios Operations
#     2.SAP Start Stop Operations
#     3.Hana DB Operations
#     4.Generate Build Sheet""")
# choice = int(input("Select Menu Item:"))
# match choice:
#     case 1:
#         print("1.Nagios Operations")
#     case 2:
#         print("2.SAP Start Stop Operations")
#     case 3:
#         print("3.Hana DB Operations")
#     case 4:
#         print("4.Generate Build Sheet")
#     case _:
#         print("Incorrect Choice")


#If Else IF
# rating = 5
# if rating > 4:
#     print("Exceptional")
# elif rating > 3:
#     print("Exceeds Expectation")
# elif rating > 2:
#     print("Meets Expectations")
# else:
#     print("Below Meets Expectation")

#Function
# def test_fun():
#     print("This is test function")
# test_fun()

# def addition(x, y):
#     sum = x + y
#     return sum
# print(addition(2, 3))
# import math
# print(math.factorial(3))


#Control Flow
# count = '5'
# for i in range(int(count)):
#     print(i)

#Type Conversion
# string = "10"
# integer = int(string)
# float = float(integer)
# back_to_string = str(float)
# print(type(back_to_string))


# #Bytearray
# ba = bytearray([65, 66, 67])
# print(ba)
# ba[0] = 10
# print(ba)

#Bytes
# numbers = bytes([45, 46, 47])
# print(numbers)

#None
# def function_without_return():
#     pass# Do something but don't return anything
# x = function_without_return()
# print(x)

# #Boolean
# is_true = True
# is_false = False
# if is_true is True:
#     print("True")
# else:
#     print("False")

# print(bool(is_true))
# print(bool(is_false))
# print(bool(0))
# print(bool(True))
# print(is_true and is_false)
# print(is_true or is_false)

# if is_true and is_false:
#     print("Statement was True")
# else:
#     print("Statement was False")


#Frozenset
# a = frozenset([1, 2, 4])
# print(a)

#List
# fruits = ['apple', 'banana', 'orange']
# print(fruits[2])
# print(len(fruits))
# print(fruits[1])

#Dict
# first_names = {"Pradeep": "Katuri", "Mercy": "Dontha"}
# for names in first_names.values():
#     print(names)

#Set
# fruit_set = {'apple', 'banana', 'srawberry'}
# number_set = {1, 2, 3, 4, 5, 3, 2, 1}
# print(number_set)
# fruit_set.add('kiwi')
# print(fruit_set)
# fruit_set.remove('kiwi')
# print(fruit_set)

# a = {1, 2, 3}
# b = {2, 3, 4}
# print(a.union(b))
# print(a.intersection(b))
