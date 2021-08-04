# File: hw6_part1.py
# Author: Nem Negash
# Date: 11/13/2018
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: figures out if a word is a palindrome or not
#def reverse():
#checks the first and the last letter of the word
#keeps checking until the letters don't match up
#if it gets to the last letter than it is a palinedrome
#it return how far it went down the word
#INPUT: word ,count, i, j
#OUTPUT: count
def Reverse(word):
    reverse = ''
    i = len(word)-1
    #if the i  reach the first letter
    #BASE CASE
    if(i < 0):
        #returns the reversed word
        return reverse
        #while i hasnt reached the first letter
    if(i >= 0):
        reverse += word[i]
        i -= 1
            #keeps callling the function till it goes to the first letter
        return reverse + Reverse(word)


def main():
    wordReverse = ''
    #gets the word it needs to check for palindrome-ness
    word = input('Please enter a word to check for palindrome-ness:')
    i = len(word)-1
    wordReverse = Reverse(word)
    #if the reverse function went all the way to the first letter
    #if that is the same as the orginal word
    #it is a palinedrome
    if(word == wordReverse):
        print('The word', word, 'IS a palindrome')
    #if the reverse word is not the same as th orginal word
    #it is not a palinedrome
    if(word != wordReverse):
        print('Sorry, the word', word, 'is NOT a palindrome')
        print('Backwards, it becomes', wordReverse)




main()
