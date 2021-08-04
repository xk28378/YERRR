# File: hw3_part2.py
# Author: Nem Negash
# Date: 09/26/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: The program will divide 2 numbers without using divison  
# or integer division.
def main():
    firstNum = int(input("Please enter the first number:"))
    secondNum = int(input("Please enter the second number:"))
#This "first" variable is so that in the final output the original first
#number is displayed.
    first = firstNum
#This variable counts how many times the while loop has occured which is
#the quotient
    answer  = 1
#This first "if" statement is for if the first number is zero
    if(firstNum == 0):
        print(first, "//", secondNum, "= 0")
    else:
        while((firstNum - secondNum) >= secondNum):
            answer += 1
            firstNum -= secondNum
#prints the final answer
        else:
            print(first, "//", secondNum, "=", answer)
        
    

main()
