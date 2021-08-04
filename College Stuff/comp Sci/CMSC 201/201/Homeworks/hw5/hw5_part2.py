# File: hw5_part.py
# Author: Nem Negash
# Date: 10/07/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: this porgram will be creating new words from the letters
#of the words teh user will input.
def main():
    letterList = []
    count = 0
#this while loops makes sure the user doesnt enter more than 5 words
    while(count < 5):
        word = input("Enter a 5-letter word:")
#Validates the word the user inputs is not more than five letters
        if(len(word) == 5):
            letterList.append(word[count])
            count += 1
#Gives the user a response if the word is more than five letters 
        if(len(word) != 5):
            print("Must be 5-letters!")
    count = 0
    print()
    print("Your new word is: ", end='')
#This while loops prints out the correct letter from each word to  create
# a the new word.
    while(count < 5):
        print(letterList[count], end='')
        count += 1
        




main()
