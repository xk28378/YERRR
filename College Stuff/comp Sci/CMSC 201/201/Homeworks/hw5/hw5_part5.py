# File: hw5_part.py
# Author: Nem Negash
# Date: 10/07/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: This program will take a secret message and use a key to
# understand the meaning.
def main():
    message = input("Enter the secret message:")
    key = int(input("Enter the key to this message:"))
    index = 0
#while index doesnt go above the number of letters it prints the letter
#at index zero plus at the letter at index plus the key until the index is
#above the number of letters in the message
    while(index < len(message)):
        print(message[index], end="")
        index += key



main()
