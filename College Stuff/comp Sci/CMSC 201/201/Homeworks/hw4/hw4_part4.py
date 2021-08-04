# File: hw4_part4.py
# Author: Nem Negash
# Date: 10/03/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: This program allows people to enter their favorite month, and
# then determine how many votes for their favorite month
def main():
#These lists account for each month in each season.
    fall = [9, 10, 11]
    winter = [12, 1, 2]
    spring = [3, 4, 5]
    summer = [6, 7, 8]
    print("1 - January")
    print("2 - February")
    print("3 - March")
    print("4 - April")
    print("5 - May")
    print("6 - June")
    print("7 - July")
    print("8 - August")
    print("9 - September")
    print("10 - October")
    print("11 - November")
    print("12 - December")
    vote = int(input("What is your favorite month? (-1 to quit):"))
#Numbers of votes for each month
    fallVotes = 0
    winterVotes = 0
    springVotes = 0
    summerVotes = 0
#Validates the user doesn't want to quit
    while(vote != -1):
#Each if, elif, and else statement adds a vote to a season depending on the
#number the user put in.
        if(vote in fall):
            fallVotes += 1
            vote = int(input("What is your favorite month? (-1 to quit):"))
        elif(vote in winter):
            winterVotes += 1
            vote = int(input("What is your favorite month? (-1 to quit):"))
        elif(vote in spring):
            springVotes += 1
            vote = int(input("What is your favorite month? (-1 to quit):"))
        elif(vote in summer):
            summerVotes += 1
            vote = int(input("What is your favorite month? (-1 to quit):"))
#Prints out the number of votes for each season.
    print(winterVotes, "votes for winter")
    print(springVotes, "votes for spring")
    print(summerVotes, "votes for summer")
    print(fallVotes, "votes for fall")
        
        


main()
