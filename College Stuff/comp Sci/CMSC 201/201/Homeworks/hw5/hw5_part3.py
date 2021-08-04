# File: hw5_part.py
# Author: Nem Negash
# Date: 10/07/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: this program helps the user create a secure password that
# fit specific rules.
def main():
    passList = []
    count = 0
    countTwo = 0
    I = "I"
    l = "l"
    password = input("Pleasee enter a password:")
#This while loop runs until the user enters a valid password
    while(count < 1):
        passList.append(password)
#Validates the password is not all lowercase letters
        if(password.islower() == True):
            print("Passwrod must have an uppercase character.")
            countTwo += 1
#Validates the password is not all uppercase letters
        if(password.isupper() == True):
            print("Password must have a lowercase character.")
            countTwo += 1
#Validates the password is more than six letters
        if(len(password) < 6):
            print("Password must be at least 6 characters")
            countTwo += 1
#Validates the password is less than twenty letters
        if(len(password) > 20):
            print("Password can't be more than 20 characters")
            countTwo += 1
#Validates the password has "7" in it if it is between 6 and 13 characters
        if(6 <= len(password) <= 13 and not("7" in password)):
            print("Shorter password must contain 7")
            countTwo += 1
#Validates the password has "2" in it if it is between 14 and 20 characters
        if(13 < len(password) <= 20 and not("2" in password)):
            print("Longer password must contain 2")
            countTwo += 1
#Validates the password doesn't have "I" and "l" at the same time
        if("I" in password and "l" in password):
            print("Password can't contain I and l at the same time")
            countTwo += 1
#Validates if the password has any possible mistakes in it
        if(countTwo > 0):
            password = input("Please enter a password:")
            countTwo = 0
#After all possible mistakes are checked for the only thing left a valid
#Password. 
        else:
            print("Thank you for picking the secure password", password)
            count += 1

main()
