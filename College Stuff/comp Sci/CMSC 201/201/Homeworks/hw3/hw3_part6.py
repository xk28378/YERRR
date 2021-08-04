# File: hw3_part6.py
# Author: Nem Negash
# Date: 09/27/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: The program will output a "counting" box.
def main():
    width = int(input("Enter a width:"))
    height = int(input("Enter a height:"))
    area = width * height
#This makes the program basically count from the area down to 1
    count = area
#countTwo accounts for the height
    countTwo = 1
#countThree makes sure that the width for each line is the same
    countThree = 1
#The first while loop represents the height 
    while(countTwo <= height):
        countTwo += 1
#the second while loop accounts for the height
        while(countThree <= width):
            print(count, end=" ")
            count -= 1
            countThree += 1
        print()
        countThree = 1
        
    




main()
