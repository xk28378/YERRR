# File: hw6_part3.py.py
# Author: Nem Negash
# Date: 11/13/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: this progrma generates the levels of Pascal's triangle requested
# by the user

def pascal(levelList, currLevel, levelsToMake):
    currLevelList = []
    count = 0
    newValue = 0
    #when the currlevel reachs the asked amount of levels
    #BASE CASE
    if(currLevel > levelsToMake):
        return None
    #if the current level isnt the levels asked for yet
    if(currLevel <= levelsToMake):
        currLevelList.append(1)
        #goes through the past level to add up the numbers
        
        while(count <= currLevel and count < len(levelList[currLevel])-1):
            #adds the numers from the pst kist and adds them to them
            #together to create the current level numbers
            #and appends them to the currnt level list 
            newValue = levelList[currLevel][count]+levelList[currLevel][count+1]
            currLevelList.append(newValue)
            count += 1
        currLevelList.append(1)
        #appends the current level list into the level list
        levelList.append(currLevelList)
    count2 = 0
    #prints out the current level of the triangle
    
    while(count2 < len(levelList[currLevel])):
        print(levelList[currLevel][count2], end = ' ')
        count2 += 1
        
    print()
    #recursion function
    #keeps repeating until base case is reached
    pascal(levelList, currLevel+1, levelsToMake)




def main():
    levelList = [[1]]
    currLevel = 0
    print("Welcome to the Pascal's triangle generator.")
    levelsToMake = int(input('Please enter the number of levels to generate:'))
    #validates the levels asked are greater than 0 
    while(levelsToMake <= 0):
        print('The level requested needs to be greater than 0')
        levelsToMake = int(input('Please enter the number of levels to generate:'))
    pascal(levelList, currLevel, levelsToMake)

        
main()        
