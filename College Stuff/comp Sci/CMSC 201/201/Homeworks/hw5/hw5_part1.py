# File: hw5_part.py
# Author: Nem Negash
# Date: 10/07/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: This program creates a number line by using the numbers
# the user inputs and uses a dash to represent the numbers missing between.
def main():
    numList = []
    num = int(input("Please enter a number (-1 to stop):"))
    count = num
    numTwo = 0
    index = 0
#This validates the user doesn't want to quit
    while(num != -1):
# This while loop adds a dash for all the missing numbers in the number line
        while(num > numTwo):
            numList.append('-')
            numTwo += 1
# This if statement validates that the number is larger than the past number
        if(num < numTwo):
            print("Please enter a bigger number")
            num = int(input("Please enter a number (-1 to stop):"))
# This if statement adds each number the user inoits into a list
        if(num == numTwo ):
            numList.append(num)
            numTwo += 1
            num = int(input("Please enter a number (-1 to stop):"))
#The while loop prints each index in the list
    while(index < len(numList)):
        print(numList[index], end=' ')
        index += 1
        



main()
