# File: hw4_part3.py
# Author: Nem Negash
# Date: 10/03/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: The program will be using an input validation componant of
#a historical database
MIN_YEAR = 1800
MAX_YEAR = 2000
def main():
    badYear = [1812, 1863, 1918, 1929, 1932, 1939, 1941, 1963, 1968, 1979]
    year = int(input("Enter a year:"))
    count = 0
#The while loop runs until the correct year is put in by the user
    while(count < 1):
#Validates that the year is higher than 1800
        if(year < MIN_YEAR):
            print("Year is too small!")
#Validates if year is even
            if(year % 2 == 1):
                print("Year is odd!")
            year = int(input("Enter a year:"))
#Validates if year is higher than 2000
        elif(year > MAX_YEAR):
            print("Year is too big!")
#Validates if year is even
            if(year % 2 == 1):
                print("Year is odd!")
            year = int(input("Enter a year:"))
#Validates if year is a bad year and if year is even
        elif(year in badYear and year % 2 == 1):
            print("That is a bad year!")
            print("Year is odd")
            year = int(input("Enter a year:"))
#Validates if year is a bad year
        elif(year in badYear):
            print("This a bad year")
            year = int(input("Enter a year:"))
#Validates if year is even
        elif(year % 2 == 1):
            print("Year is odd!")
            year = int(input("Enter a year:"))
#If all these validations are passed than the year is correct
#and prints out the correct statement.
        else:
            print("Searching the database for. . .", year)
            count += 1



main()
