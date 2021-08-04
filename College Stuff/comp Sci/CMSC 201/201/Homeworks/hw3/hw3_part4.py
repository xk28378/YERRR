# File: hw3_part4.py
# Author: Nem Negash
# Date: 09/27/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: this program will be able to act like a personal pedometer,
# by asking the user how many steps they travelled in one week
def main():
    count = 1
#This list holds the number of steps wlaked each day
    stepList = []
#This wihile loop adds each day's steps to the list above
    while(count <= 7):
        print("For day", count)
        steps = int(input("steps today:"))
        stepList.append(steps)
        count += 1
#prints the least amount of steps walked by finding the min in the list
    print("The min day was day", (stepList.index(min(stepList))+ 1), "when you walked",
          min(stepList), "steps.")
#prints the most amount of steps walked by finding the max in the list    
    print("The max day was day", (stepList.index(max(stepList))+ 1), "when you walked",
          max(stepList), "steps.")


main()
