# File: proj1.py
# Author: Nem Negash
# Date: 10/18/2018
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: This is a text base game where you are being chased by the
# "The Demogorgon" in a forest and you are trying to escape from it.

##################################
#### DO NOT TOUCH THESE LINES ####
from random import randint, seed #
#seed(100)                       #
##################################

#constants for health of player and monster
MAX_HEALTH = 100
MIN_HEALTH = 0
DEM_MAX_HEALTH = 300

#constant for survival
SURVIVE_DAYS = 7
SURVIVE_DISTANCE = 150

#constants of lists
ITEMS = ["Sword", "Bicycle", "Hi-c", "Heelys", "Walkman", "Laser Cannon","RubberBand"]
FOODS = ["Reese's Pieces", "Pop Rocks", "Ovaltine", "Wonder Bread", "Twinkies"]
CHOICE = [1, 2, 3, 4]
FIGHT = ['fight', 'flee', 'flail']
WEAPONS = ['Flashlight', 'Walkie Talkie', 'Rubber Band', 'Sword', 'Lasercannon']

#a print function for the begining of the game
def begin():
    print("After miles and miles of hicking in the woods, you finally setup your camp.")
    print("You decided to go camping on the wrong weekend")
    print("Your phone buzzes:")
    print("                 THE DEMOGORDON HAS ESCAPED          RUN.       ")


#a print function for all morning activities
def displayMorMenu():
    print('What would you like to do this morning')
    print('Your options are:')
    print('1 - View your inventory')
    print('2 - View Current Stats')
    print('3 - Eat an Eggo Waffle')
    print('4 - Nothing else.')


#a print function for the choice to leave or stay at your camp
def leaveOrStayMenu():
    print('Your options are:')
    print('1 - Pack up camp and go')
    print('2 - Stay where you are')


#a print function for the choice to equip or unequip an item in your inventory
def equipMenu():
    print('1 - Equip')
    print('2 - Unequip')
    print('3 - I changed my mind')


#a print function that prints out the list of items in your inventory
def inventoryMenu(inventory):
    print('Your options are:')
    count = 1
    while(count <= len(inventory)):
        print(count, "-", inventory[count-1])
        count += 1


#a print function for the choice to eat or to leave it for food found
def eatMenu():
    print('Your options are:')
    print('1 - eat it')
    print('2 - put it back')


#a print function for when the user wins the game
def win(health, equip, distance, day):
    print("Congratulations!")
    print('You made it to civilization alive.')
    print('It took you', day, 'days to go', distance, 'miles')
    print()
    print("Final stats:")
    print("Health:", health)
    print("Distance travelled:", distance)
    print("Equipped item:", equip)


#this is a function that gets the user's choice and return the integer
def getUserChoice():
    choice = int(input('Enter a choice:'))
    return choice
    


#the eat function calculates the new health after intaking the found food
#and return the new health to the main function
def eat(health, num):
    count = 0
#each if statement checks for the food the player found
#and adds or subtracts from the health depending on what it is
    if(FOODS[num]== FOODS[0]):
        print("You ate some Resse's Peices. These will make you fat.")
        print("Your health has decreased by 30 points.")
        while(count < 30 and health > MIN_HEALTH):
            health -= 1
            count += 1
        return health
    if(FOODS[num] == FOODS[1]):
        print("You ate some Pop Rocks. These are bad for you.")
        print("Your health has decreased by 5 points.")
        while(count < 5 and health > MIN_HEALTH):
            health -= 1
            count += 1
        return health
    if(FOODS[num] == FOODS[2]):
        print("You ate some Ovaltine. This makes you stronger.")
        print("Your health has increased by 15 points")
        while(count < 15 and health < MAX_HEALTH):
            health += 1
            count += 1
        return health
    if(FOODS[num] == FOODS[3]):
        print("You ate the Wonder Bread. A true wonder of modern science in loaf form.")
        print("Your health has increased by 25 points")
        while(count < 25 and health < MAX_HEALTH):
            health += 1
            count += 1
        return health
    if(FOODS[num] == FOODS[4]):
        print("You ate some Twinkies. The best thing for a man in the world.")
        print("Your health has increased by 30 points")
        while(count < 30 and health < MAX_HEALTH):
            health += 1
            count += 1
        return health



# this function calculates the damage the user does to the monster
# by checking what weapon they have equip 
def calcDamage(equip):
    damage = 0
#each if elif statement checks what weapon the player has and
#and according to that calculates the damage the player does
    if(equip == WEAPONS[0]):
        damage += 5
    elif(equip == WEAPONS[1]):
        damage += 10
    elif(equip == WEAPONS[2]):
        damage += 25
    elif(equip == WEAPONS[3]):
        damage += 50
    elif(equip == WEAPONS[4]):
        damage += 100
    return damage



# this function runs the entire fighting sequence in the game
# it takes in the health, the weapon equip and the inventory
# and returns the health of the player after the fight to the main function
def fight(health, equip, inventory):
    print('The Demogorgon appears infront of you.')
    print('Its face opens up like a flower to display rows and rows of', end="")
    print('teeth. It came here for a fight.')
    monster_health = 300
    monster_attack = 20
    index = 0
#this while loop runs through the inventory list to see if
#the player has any power ups to use against the monster 
    while(index < len(inventory)):
        #checks for Hi-ci
        if(inventory[index]== ITEMS[2]):
            monster_health /= 2
        #checks for Walkman
        elif(inventory[index] == ITEMS[4]):
            monster_attack = monster_attack * 0.75
        index += 1
#this while loop runs the fight sequence until the player or the monster die
#or the player manages to escape
    while(health > 0 and monster_health > 0):
        print('Your health:', health)
        print('Monster health:', monster_health)
        print()
        print('What do you do now?')
        print()
        print('Your options are:')
        print('1 - Fight')
        print('2 - Flail')
        print('3 - Flee')
        choice = getUserChoice()
#this if statment validates if the user is trying to fight
        if(choice == 1):
        #each if statment accounts for the diffrent weapon the user has
        #prints the attack by the player and by the monster
        #could have used a list for the damage number by the playe now that
        #I think about it
            if(equip == WEAPONS[0]):
                print('You strike the Demogorgon with your', equip, 'for 5 damage')
                monster_health -= calcDamage(equip)
                print('The Demgorgon strikes you back for', monster_attack,'damage')
                health -= monster_attack
            elif(equip == WEAPONS[1]):
                print('You strike the Demogorgon with your', equip, 'for 10 damage')
                monster_health -= calcDamage(equip)
                print('The Demgorgon strikes you back for', monster_attack,'damage')
                health -= monster_attack
            elif(equip == WEAPONS[2]):
                print('You strike the Demogorgon with your', equip, 'for 25 damage')
                monster_health -= calcDamage(equip)
                print('The Demgorgon strikes you back for', monster_attack,'damage')
                health -= monster_attack
            elif(equip == WEAPONS[3]):
                print('You strike the Demogorgon with your', equip, 'for 50 damage')
                monster_health -= calcDamage(equip)
                print('The Demgorgon strikes you back for', monster_attack,'damage')
                health -= monster_attack
            elif(equip == WEAPONS[4]):
                print('You strike the Demogorgon with your', equip, 'for 100 damage')
                monster_health -= calcDamage(equip)
                print('The Demgorgon strikes you back for', monster_attack,'damage')
                health -= monster_attack
            else:
                print('You strike the Demogorgon with your', equip, 'for 0 damage')
                monster_health -= 0
                print('The Demgorgon strikes you back for', monster_attack,'damage')
                health -= monster_attack
#this elif statement accounts for if the player chooses to flail so they die
        elif(choice == 2):
            health = 0
            print('You have died in the hands of the Demogorgon.')
            return health
#this elif statement accounts for if the user trys to run from the monster
        elif(choice == 3):
            #finds a random number from 1-10
            num = randint(1,10)
            #if the number if less than 4 meaning  30% chance the player escapes
            if(num <= 3):
                print('You try to run away from the fight. You are ', end="")
                print('successful, and you live to die another day')
                return health
            #the other 70% means the player doesn't get to escape from the monster,
            #loses 10 health and have to decide what they want to do again
            elif(num > 3):
                print('You try to run away from the fight. The Demogorgon ', end="")
                print('blocked your attempt to run.')
                print('It hits you for', (monster_attack / 2))
                health -= (monster_attack / 2)
# returns the new health back to main
    return health

                
        
                     
# the main function runs the whole game using the functions listed above plus
#more code
def main():
    inventory = ["Walkie Talkie", 'Flashlight']
    health = MAX_HEALTH
    day = 1
    distance = 0
    equip = "N/A"
    begin()
#this while loop runs until the player has lived for 7 days or they have
#have travled for 150 miles or the player dies
    while(day < SURVIVE_DAYS and distance < SURVIVE_DISTANCE and health > MIN_HEALTH):
        count = 0
        print("The sun rises on Day", day, "in the forest.")
        print()
        displayMorMenu()
    #gets the user's morning choice
        choice = getUserChoice()
    # this if statement account for if the user wants to see their inventory
    #and equip or unequip something
        if(choice == CHOICE[0]):
            print()
            print('Here is what your inventory looks like:')
            print(inventory)
            print()
            print('Do you want to equip an item?')
            print()
            equipMenu()
        #gets the user choice on what they want to do from their inventory
            choice1 = getUserChoice()
            #if they want to equip an item
            if(choice1 == CHOICE[0]):
                inventoryMenu(inventory)
                choice2 = getUserChoice()
                print()
                equip = inventory[choice2 -1]
                print("You have equipped", inventory[choice2-1])
            #if they want to unequip an item and hold nothing
            elif(choice1 == CHOICE[1]):
                equip = 'N/A'
                print()
                print("You now have nothing equiped")
            #if they changed their mind and don't want to do anything else
            #in the inventory
            elif(choice1 == CHOICE[2]):
                print("OK, that is fine")
                print()
    #this if statement is if they choose to see their stats 
        if(choice == CHOICE[1]):
            print("Health:", health)
            print("Distance travelled:", distance)
            print("Equipped item:", equip)
    #this if statement is if they want to eat an eggo waffle 
        if(choice == CHOICE[2]):
            print('You ate the Eggo Waffle. So bad, yet so good.')
            print('Your health has increased by 10 points.')
            count = 1
        #if they choose to eat a eggo waffle then this while loop will
        #incease their health by 10 or until they hit MAX_HEALTH
            while(health < MAX_HEALTH and count <= 10):
                health += 1
                count += 1
    #this if statement is if they are done with all their morning activities
        if(choice == CHOICE[3]):
            print('The demogorgon looms in a distance. Do you leave your camp or do you stay?')
            print()
            leaveOrStayMenu()
        #this gets the choice from the user if they want to stay or leave 
            choice2 = getUserChoice()
            count = 0
        #this if statement is if the user want to leave
            if(choice2 == CHOICE[0]):
                print('You quickly pack up your camp.')
                print('You begin heading in the direction of the nearest town.')
            #finds a random number from 1-10
                num = randint(1,10)
                #if the number is less than 3 meaning 20% chance of the player
                #finding a backpack with food
                if(num <= 2):
                    num2 = randint(0,4)
                    print('As you are walking, you found a backpack.')
                    print('Inside the backpack, there was some', FOODS[num2])
                    print('Do you want to eat it?')
                    print()
                    eatMenu()
                    #asks the player if they want to eat it or not
                    choice1 = getUserChoice()
                    #if they choose to eat it then the eat function is run
                    if(choice1 == CHOICE[0]):
                        health = eat(health, num2)
                    #if they choose to to leave it then nothing happens
                    elif(choice1 == CHOICE[1]):
                        print("You have left the backpack where you found it.")
                #if the number is 3 or 4 meaning another 20% chance the player
                #finds a shed in the woods and finds an item which is added to
                #their inventory
                elif(num == 3 or num == 4):
                    num3 = randint(0,6)
                    print('You pass by an old shed and decide to go inside. ', end="")
                    print('Something on the shelf catches your eye.')
                    print("You reach to grab the item. It's a", ITEMS[num3])
                    print("The", ITEMS[num3].upper(), "has been added to your inventory.")
                    inventory.append(ITEMS[num3])
                #if the number is 5 or 6 meaning another 20% chance the player
                #falls into a trench and loses another day climbing out
                #and travels only half of what they would have if they didn't fall
                elif(num == 5 or num == 6):
                    print("You fell into a trench because you weren't paying attention ", end="")
                    print('to where you were stepping.')
                    print('It takes you a whole extra day to climb out.')
                    distance = distance - ((health/4)+5)/2
                    day += 1
                #if the number is 7, 8 or 9 which is a 30% chance the player
                #has to face the demogorgon and the fight function is run
                elif(num == 7 or num== 8 or num == 9):
                    health = fight(health, equip, inventory)
                #if the number is 10 meaning a 10% chance the player
                #faces nothing the whole day.
                elif(num == 10):
                    print('Nothing happend. you live to die another day.')
            #this elif statment is if the player decides to stay at camp
            else:
                #finds a random number between 1-10
                chance = randint(1,10)
                #if the number is greater than 3 which means 70% chance
                #the player will face the monster and the fight function is run
                #1 is added to count so distance isn't added
                if(chance > 3):
                    print('The demogorgon has come to your camp to fight.')
                    health = fight(health, equip, inventory)
                    count += 1
                #if the number is less than 4 which means 30% chance than the
                #player isn't found by the monster and ntohog happens
                #1 is added to count so distance isn't added
                elif(chance <= 3):
                    print('You have successfully have evaded the monster')
                    health = 100
                    count += 1
            day += 1
            index = 0
            count2 = 0
        #this while loop looks through the user's inventory to see if
        #the player has any items to give them a distance boost
        #the count is if the player decied to stay at camp it increases
        #by 1 and that will let python know that the payer stayed at camp
        #and won't add any distance
            while(index < len(inventory) and count < 1):
                #checks if the user has a bicyle and calulates distance
                #with the boost if the player does
                if(inventory[index]== ITEMS[1]):
                    print("The Bicycle you found have improved your distance")
                    distance += ((health/4)+5) * 1.5
                    count += 1
                    count2 += 1
                index += 1
            index = 0
                #checks if the user has heelys and calculates distance
                #with the boost if the player does
                #count2 is if they player already has a bycycle so this
                #while loop doesn't run
                #count is if the player stayed at camp so distance won't
                #be added
            while(index < len(inventory) and count < 1 and count2 < 1):
                if(inventory[index] == ITEMS[3]):
                    print("The Heelys you found have improved your distance")
                    distance += ((health/4)+5) * 1.25
                    count += 1
                index += 1
            #this if statement is if the player has no distance boost
            #so it calcultes the regular distance
            if(count < 1):
                distance += ((health/4)+5)
            print()
            print('You have traveled', distance, 'miles')
    #if the player has more than 0 health and has lived for 7 days or traveled
    #150 miles then the player won the game and runs the win function
    if(health > MIN_HEALTH and (day >= SURVIVE_DAYS or distance >= SURVIVE_DISTANCE)):
       win(health, equip, distance, day)
    #if the player dies then the player loses
    if(health <= MIN_HEALTH):
       print("You have died in the wilderness and no one will remember you :(")
       
       
                  
              
              
    
    
main()
    
                 
    
    
