# File: hw4_part1.py
# Author: Nem Negash
# Date: 10/03/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: the program will create a sideways pyramid with a
#character.
def main():
    char = input("Please enter a single character:")
    width = int(input("Enter the width of the pyramid:"))
#Validates that the width is greater than 0
    while(width <= 0):
        print("Width must be greater than 0")
        width = int(input("Enter the width of the pyramid:"))
    countTwo = 0
    count = 1
#The first nested while loop creates the first half of the pyramid.
    while(countTwo < width):
        countTwo += 1
        while(count <= countTwo):
            print(char, end=" ")
            count += 1
        print()
        count = 1
#This second nested while loop creates the second half of the pyramid.
    while(countTwo <= width and countTwo != 0):
        countTwo -= 1
        while(count <= countTwo):
            print(char, end=" ")
            count += 1
        print()
        count = 1





main()
