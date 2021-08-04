# File: hw4_part5.py
# Author: Nem Negash
# Date: 10/03/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: this program isolates the vowels in a sequence of letters
# and stores those letters in a list.
def main():
#This list will contain all the letters the user inputs
    letters = []
#This is the list of vowewls
    vowels = ["a", "e", "u", "o", "i"]
    user = input("Please enter a letter of a word('QUIT' to exit):")
#Validates the user does not want to quit
#Adds each letter the user inputs to the 'letters' list
    while(user != "QUIT"):
        letters.append(user)
        user = input("Please enter a letter of a word('QUIT' to exit):")
    count = 0
    vowelCount = 0
    consCount = 0
#Validates count doesnt go over the number of letters in the list.
    while(count < len(letters)):
#if the letter is a vowel prints out the letter with the square brackets
        if(letters[count] in vowels):
            print(" [ ", letters[count], " ] ", end=" ")
            count += 1
            vowelCount += 1
#prints out the consonant
        else:
            print(letters[count], end=" ")
            count += 1
            consCount += 1
#Starts a new line
    print()
#prints out the number of consonants and vowels. 
    print("There were a total of", vowelCount, "vowels and", consCount,"consonants")
        
            




main()
