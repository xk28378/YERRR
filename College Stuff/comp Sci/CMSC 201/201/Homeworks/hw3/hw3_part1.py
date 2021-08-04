# File: hw3_part1.py
# Author: Nem Negash
# Date: 09/25/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: This program simulates the up and down movement of a hailstone
#in a strom.
def main():
#asks the user for the starting height of the hailstone
    height = int(input("Please enter the starting height of the hailstone:"))
#gives the stating point of the hailstone
    print("Hailstone is currently at height", height)
#While loop finds the new value of the height and continues until value of is
#one or zero
    while( height > 1):
        if(height %2 == 0):
            height = height//2
            print("Hailstone is currently at height", height)
        elif(height %2 == 1):
            height = (height*3)+1
            print("Hailstone is currently at height", height)
#If the value of height goes to 1 the program stops
    if(height == 1):
         print("Hailstone stopped at height 1")
#If the value of the height goes to 9 the program stops
    elif(height == 0):
        print("Hailstone stopped at height 0")
main()
