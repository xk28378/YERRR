# File: hw3_part5.py
# Author: Nem Negash
# Date: 09/27/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: the program will print out the numbers from 1-105 but
# will have special cases will it will print out a messaeg for specific numbers
MAX = 105
def main():
    count = 0
    while(count < MAX):
        count += 1
#The first three "if" statments look to see if the number is valid to the
#the special cases and prints the correct sentence and if not prints the
# number itself.
        if(count % 3==0 and count % 7==0):
            print("Some infinities are bigger than some infinities")
            
        elif(count % 3==0):
            print("The dog of wisdom knows all this number")

        elif(count % 7==0):
            print("Hold on I have a meme for this")

        else:
            print(count)




main()
