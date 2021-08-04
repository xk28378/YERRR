# File: hw4_part2.py
# Author: Nem Negash
# Date: 10/03/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: The program allows the user to add items to a wish list
#they want to purcahse
def main():
    item = input("Enter an item you want ('Q' to quit):")
    wishList = []
    wishList.append(item)
    count = 0
#The loop adds each item the user inputs into a list
    while(item != "Q"):
        wishList.append(item)
        item = input("Enter an item you want ('Q' to quit):")
        count += 1
    print("There are", count, "items on your list")
#Depending on the ammount of items in the list these if, elif and else
#Statments print the correct output.
    if(count < 5):
        print("There is not enough items on your list.")
    elif(count > 5):
        print("There are too many items on your list.")
    else:
        print("You have the perfect numbere of items.")


main()
