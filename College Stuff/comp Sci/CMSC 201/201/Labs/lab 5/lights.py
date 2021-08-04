# File: lights.py
# Author: Nem Negash
# Date: 10/03/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: asks the user to flip switches and then tells the user if
# the switch is on or off
def main():
    switches = [False, False, False, False, False]
    count = 1
    on = True
    off = False
    while(count <= 5):
        if(switches[count -1] == off):
            print("light", count, "is off.")
            count += 1
        else:
            print("light", count, "is on.")
            count += 1
    flip = int(input("Enter a switch to flip (0 to stop):"))
    switches[flip-1]= not(switches[flip-1])
    while(flip != 0):
        flip = int(input("Enter a switch to flip (0 to stop):"))
        switches[flip-1]= not(switches[flip-1])
    switches[flip-1]= not(switches[flip-1])
    print("Switches:", switches)
    print("Switches after:")
    countTwo = 1
    while(countTwo <= 5):
        if(switches[countTwo -1] == off):
            print("light", countTwo, "is off.")
            countTwo += 1
        else:
            print("light", countTwo, "is on.")
            countTwo += 1
        
        
        



main()
