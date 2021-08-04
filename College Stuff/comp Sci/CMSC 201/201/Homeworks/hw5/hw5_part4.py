# File: hw5_part.py
# Author: Nem Negash
# Date: 10/07/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: This program plays with the capitalization of the letters
#of the word the user inputs.
def main():
    print("1 - All uppercase.")
    print("2 - All lowercase.")
    print("3 - Every other letter.")
    print("4 - Opposite.")
    wordList = []
    menu = int(input("Please enter a menu option:"))
#VAlidates the user's menu choice is not more than four
    while(menu > 4):
        print("Invalid choice!")
        menu = int(input("Please enter a menu option:"))
    word = input("Please enter a string:")
    count = 0
    index = 0
    countTwo = 0
#This loop repeates while one of the options is completed 
    while(countTwo < 1):
#For the first menu choice this if statement changes all the letters to
#uppercase letters 
        if(menu == 1):
            print(word.upper())
            countTwo += 1
#For the second menu choice this elif statement changes all the letters to
#lowercase letters
        elif(menu == 2):
            print(word.lower())
            countTwo += 1
#For the third menu choice this elif statement changes everyother letter to
#Upper case letters
        elif(menu == 3):
            #Makes sure the index doesn't go over the number of letters
            while(index < len(word)):
                #Changes all the even index letter to uppercase
                if(index % 2 == 0):
                    print(word[index].upper(), end="")
                    index += 1
                #Changes all the odd index letters to lowercase
                else:
                    print(word[index].lower(), end="")
                    index += 1
            countTwo += 1
#For the fourth choice this elif statement changes every letter to the
#opposite lettercase
        elif(menu == 4):
            while(index < len(word)):
                #if the letter at that index is a lowercase it changes it to
                #an uppercase
                if(word[index].islower()):
                    print(word[index].upper(), end='')
                    index += 1
                #if the letter at that index is an uppercase it chnages it to
                #a lowercase
                else:
                    print(word[index].lower(), end='')
                    index += 1
            countTwo += 1


main()
