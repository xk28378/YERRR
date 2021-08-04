# File: hw6_part2.py
# Author: Nem Negash
# Date: 11/15/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: finds the GCD(greatest common divisor) of two numbers


#def gcd():
#takes in number and dides up to the number
#and adds all the quotients that are integers into a list
#it repeats for the second number
#INPUT: the first and  second number and count to "keep track"
#OUTPUt: List of all the factors of the num
def gcd(num1, num2, count):
    numList = []
    divide = 0
    #if the tracker has hit the number itself
    #BASE CASE
    if(count > num1):
        return numList
    
    if(count <= num1):
        divide = num1/count
        #if the quotient is an integer then it is a factor
        #of the numer and it appends it to a list
        if(divide == int(divide)):
            numList.append(int(divide))
        return numList + gcd(num1, num2, count+1)


    
def main():
    #lists for the facotrs
    num1List = []
    num2List = []
    count = 1
    num1 = int(input("Please enter the first integer:"))
    #validates that the first number is greater than 0
    while(num1 < 1):
        print('Number has to be more than 0')
        num1 = int(input("Please enter the first integer:"))
    num2  = int(input('Please eneter the second integer:'))
    #validates that the second number is greater than 0
    while(num2 < 1):
        print('Number has to be more than 0')
        num2 = int(input("Please enter the second integer:"))
    #all factors are added to the numlist for each number
    num1List = gcd(num1, num2, count)
    num2List = gcd(num2, num1, count)
    count1 = 0
    count2 = 0
    #this while loop checks for which one if the largest factor
    #for both number by finding the largest number in both lists
    while(count1 < len(num1List)):
        while(count2 < len(num2List)):
            #if there are to numbers equal. to eachother from each list
            #it prints out the gcd
            if(num1List[count1] == num2List[count2]):
                print('The GCD for', num1, 'and', num2, 'is', num1List[count1])
                #ends the while loop y making the arguments false
                count1 = len(num1List)
                count2 = len(num2List)
            count2 += 1
        count2 = 0
        count1 += 1
            



main()
        
        
        
    
