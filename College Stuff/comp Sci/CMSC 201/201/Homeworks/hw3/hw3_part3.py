# File: hw3_part3.py
# Author: Nem Negash
# Date: 09/27/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: the program will give the cost of a movie depending on
# the answers of the user
MAX_TIME = 10
MAX_PRICE = 15
def main():
    count = 0
    time = int(input("Please enter how many times watched:"))
#This eliminates all the possible wrong inputs for time
    while(time > MAX_TIME):
        print("We don't accept movies watched", time, "times")
        time = int(input("Please enter how many times watched:"))
        
    while(time < 0):
        print("You can watch a movie negative amount of times")
        time = int(input("Please enter how many times watched:"))
        
    else:
        price = float(input("Please enter the price you want to sell for:"))
#this eliminates all the possible wrong inputs for price
        while(price < 0):
            print("We can't accept a negative amount")
            price = float(input("Please enter the price you want to sell for:"))
            
        while(price > MAX_PRICE):
            print("That's too much")
            price = float(input("Please enter the price you want to sell for:"))
            
        while((price % 0.25) != 0):
            print("We only accpet prices that can be paid in quarters")
            price = float(input("Please enter the price you want to sell for:"))
            
        else:
            genre = input("Enter the genre of the movie (romance, comedy):")
#This eliminates all the possible wrong inputs for genre
            
            while(genre != "romance" and genre != "comedy"):
                print(genre, "is not a vaild type, choose from romance or comedy")
                genre = input("Enter the genre of the movie (romance, comedy):")

            else:
#After all the possible wrong inputs are eliminated the only thing left
#is the correct input.
                while(count <= 0):
                    print("You are selling a", genre, "movie that has been watched",
                          time, "times for", price, "dollars.")
                    count += 1
        
        
main()
