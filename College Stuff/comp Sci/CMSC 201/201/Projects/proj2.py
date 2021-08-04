#ile: proj2.py
# Author: Nehmya Negash
# Date: 11/04/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: to play connect 4

##################################
#### DO NOT TOUCH THESE LINES ####
from random import randint, seed #
#seed(100)                       #
##################################

#costants of input
INPUT = ['y','n']
QUESTION = ['Would you like to play again? (y/n):', 'Play against the computer? (y/n):']

#board constants
MIN_WIDTH  = 5
MIN_HEIGHT = 5

#def gameBoard(num1, num2, list):
	#while loop that goes through each list in the mainlist
	#in the whileloop another while loop will go through each
	#innnerlist and add the '-' as a place holder
	#each while loop's counter is num1 and num2
#INPUT:num1 num2 num3 
#OUTPUT: 2d list
def gameBoard(row, col, elem):
    grid = []
    rowList = []
    for i in range(col):
        rowList.append(elem)
    for i in range (row):
        grid.append(rowList[:])
    return grid


#def printBoard():
	#prints game board after each turn
def printBoard(row, col, List):
    for i in range(row):
        for j in range(col):
            print(List[i][j], end= " ")
        print()


#def Inputvalidation(playerinput):
	#checks if the number the player enetred is valid 
	#if the number the plaer puts in is more than 
	#the width it is invalid and gets promted again
#INPUT: playerinput
#OUTPUT: valid playerinput        
def inputValidation(Input,col, List):
    Input = int(Input)
    while(Input > col):
        print('Your choice can not be greater than the width')
        print('Enter a column to place your piece in (1 -', col, '):', end='')
        Input = int(input())
    while(List[0][Input-1] != '-'):
        print('That column is full please choice another column')
        print('Enter a column to place your peice in (1-', col, '):', end='')
        Input = int(input())
    return Input


#def answerValidation(playerinput):
	#checks if the input is 'y' or 'n' for those type of questions
	#if the input is invalid the user is promted again
#INPUT: playerinput
#OUTPUT: valid playerinput
def answerValidation(Input, quesNum):
    Input = input(QUESTION[quesNum])
    while(Input != 'y' and Input != 'n'):
        print('That is not a valid choice')
        Input = input(QUESTION[quesNum])
    return Input


#This function runs each turn for player one
#it appends the 'x' onto the board
#INPUT = the player's column choice
#OUTPUT = the new board with the plaer's piece added
def Player1(player1 , board, row):
    count = row-1
    player1 -= 1
    if(board[0][player1] == '-'):
        while(count >= 0):
            if(board[count][player1] == 'x' or board[count][player1] == 'o'):
                count -= 1
            else:
                board[count][player1] = 'x'
                count = -1
    return board



#This function runs each turn for player two
#it appends the 'x' onto the board
#INPUT = the player's column choice
#OUTPUT = the new board with the plaer's piece added
def Player2(player2, board, row):
    count = row-1
    player2 -= 1
    if(board[0][player2] == '-'):
        while(count >= 0):
            if(board[count][player2] == 'x' or board[count][player2] == 'o'):
                count -= 1
            else:
                board[count][player2] = 'o'
                count = -1
    return board



#def computer():
	#random number from 1 to the column width 
	#places an 'o' at that column
#INPUT= the random number(num)
#OUTPUT = new board with computer piece added
def Computer(board, row, col, num):
    num -= 1
    count = row - 1
    if(board[0][num] == '-'):
        while(count >= 0):
            if(board[count][num] == 'x' or board[count][num] == 'o'):
                count -= 1
            else:
                board[count][num] = 'o'
                count = -1
    return board


#def win(win):
        #the fucntion checks around the new peice added
        #every round
	#checks if four x or o are in a row 
	#checks if four x or o are in a column 
	#checks if four x or o are connected diagonal
	#if any of these occur win = true and return win
	#if nothing occurs returns win as false
#INPUT = win = false
#OUTPUT = win= true or win = false
def Win(player1, row, board, col, win):
    player1 -= 1
    #the first test group is for checking up or down
    test1 = True
    test2 = False
    test3 = False
    test4 = False
    #this sets of tests group is for checking diagnol
    dtest2 = False
    dtest3 = False
    dtest4 = False
    #this group of tests is for checking side to side
    stest2 = False
    stest3 = False
    stest4 = False
    count = 0
    backup = player1
    #checks for where the newly added piece is
    while(board[count][player1] == '-'):
        count += 1
    backup2 = count
    #checks is connect 4 down
    if(count > 0 and count < row-1):
        if(board[count][player1] == board[count+1][player1]):
            test2 = True
            count += 1
            if(count > -1 and count < row-1):
                if(board[count][player1] == board[count+1][player1]):
                    test3 = True
                    count += 1
                    if(count > 1 and count < row-1):
                        if(board[count][player1] == board[count+1][player1]):
                            test4 = True
                            win = True
                            return win
    count = backup2
    #checks connect 4 to the left
    if(player1 > 0 and player1 < col-1):
        if(board[count][player1] == board[count][player1-1]):
            stest4 = True
            player1 -= 1
            if(player1 > 0 and player1 < col-1):
                if(board[count][player1] == board[count][player1-1]):
                    stest3 = True
                    player1 -= 1
                    if(player1 > 0 and player1 < col-1):
                        if(board[count][player1] == board[count][player1-1]):
                            stest2 = True
                            win = True
                            return win
    player1 = backup
    count = backup2
    #checks connect 4 to the right
    if(player1 > 0 and player1 < col-1):
        if(board[count][player1] == board[count][player1+1]):
            stest2 = True
            player1 += 1
            if(player1 > 0 and player1 < col-1):
                if(board[count][player1] == board[count][player1+1]):
                    stest3 = True
                    player1 += 1
                    if(player1 > 0 and player1 < col-1):
                        if(board[count][player1] == board[count][player1+1]):
                            stest4 = True
                            win = True
                            return win
    player1 = backup
    count = backup2
    #checks connect 4 diaognal up right
    if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
        if(board[count][player1] == board[count-1][player1+1]):
            dtest4 = True
            player1 += 1
            count -= 1
            if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
                if(board[count][player1] == board[count-1][player1+1]):
                    dtest3 = True
                    player1 += 1
                    count -= 1
                    if(player1 < col-1 and count > 0):
                        if(board[count][player1] == board[count-1][player1+1]):
                            dtest2 = True
    player1 = backup
    count = backup2
    #checks connet 4 diagonal up left
    if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
        if(board[count][player1] == board[count-1][player1-1]):
            dtest4 = True
            player1 -= 1
            count -= 1
            if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
                if(board[count][player1] == board[count-1][player1-1]):
                    dtest3 = True
                    player1 -= 1
                    count -= 1
                    if(player1 > 0 and count > 0 ):
                        if(board[count][player1] == board[count-1][player1-1]):
                            dtest2 = True
    player1 = backup
    count = backup2
    #checks for diagonal down right
    if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
        if(board[count][player1] == board[count+1][player1+1]):
            dtest2 = True
            player1 += 1
            count += 1
            if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
                if(board[count][player1] == board[count+1][player1+1]):
                    dtest3 = True
                    player1 += 1
                    count += 1
                    if(player1 < col-1 and count < row-1):
                        if(board[count][player1] == board[count+1][player1+1]):
                            dtest4 = True
    player1 = backup
    count = backup2
    #checks for diagonal down left
    if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
        if(board[count][player1] == board[count+1][player1-1]):
            dtest2 = True
            player1 -= 1
            count += 1
            if(player1 != 0 and player1 != col-1 and count != 0 and count != row-1):
                if(board[count][player1] == board[count+1][player1-1]):
                    dtest3 = True
                    player1 -= 1
                    count += 1
                    if(player1 > 0 and count > row-1):
                        if(board[count][player1] == board[count+1][player1-1]):
                            dtest4 = True
    #if three of these tests are true then someone won
    #returns win as true
    if(test2 == True and test3 == True and test4 == True):
        win = True
    if(dtest2 == True and dtest3 == True and dtest4 == True):
        win = True
    if(stest2 == True and stest3 == True and stest4 == True):
        win = True
    return win


#def Draw(board, col, win, draw):
    #checks to see if the first list of
    #the 2d list is full meaning the board is full
    #if win is still false then its a draw
    #returns draw as true
#INPUT = draw = false
#OUTPUT = draw = true or draw = false

def Draw(board, col, win, draw):
    count = 0
    count2 = 0
    while(win == False and count < col):
        if(board[0][count] == 'x' or board[0][count] == 'o'):
            count2 += 1
        count += 1
    if(count2 >= col):
        draw = True
    return draw
        


#def main():
	#win = false
	#print(welcome to connect 4)
	#num1 = int(input('enter a width'))
	#if statement to validate the number is bigger than 5
	#num2 = int(input('enter a height:'))
	#if statement to validate the number is bigger than 5
	#playerinput = input('play against computer?(y/n))
	#anservalidation(playerinput)
	#print game board
	#while loop while win = false and playerinput = n
		#player one gets to place a x
		#printBoard()
		#win(win)
		#if win != true:
			#player two gets to place an o
			#printBoard()
			#win(win)
		#the while loop runs till the win function returns 	
		#win as true
	#while loop while win = false and playerinput = y
		#player on gets to place an x
		#printBoard()
		#win(win)
		#if win != true: 
			#computer()
			#printBoard()
			#win(win)
	#loops till win = true
	#asks user if they want to play again
	#if yes:
		#main()
	#else:
		#print(thanks for playing!)
def main():
    board = []
    computer = 0
    playAgain = 0
    win = False
    draw = False
    print('Welcome to Connect 4!')
    row = int(input('Enter a height:'))
    while(row < MIN_HEIGHT):
        print('Height needs to be 5 or more')
        row = int(input('Enter a height:'))
    col = int(input('Enter a width:'))
    while(col < MIN_WIDTH):
        print('Width needs to be 5 or more')
        col = int(input("Enter a width:"))
    board = gameBoard(row, col, '-')
    computer = answerValidation(computer, 1)
    printBoard(row, col, board)
    if(computer == 'n'):
        while(win == False and draw == False):
            print('Player 1 what is your choice?')
            print('Enter a column to place your peice in (1-', col,'):', end='')
            player1 = int(input())
            player1 = inputValidation(player1, col, board)
            board = Player1(player1, board, row)
            printBoard(row, col, board)
            win = Win(player1, row, board, col, win)
            if(win == True):
                print('Player 1 has won the game!')
            draw = Draw(board, col, win, draw)
            if(draw == True):
                print("It's a draw")
            if(win == False and draw == False):
                print('Player 2 what is your choice?')
                print('Enter a column to place your peice in (1-', col, '):', end='')
                player2 = int(input())
                player2 = inputValidation(player2, col, board)
                board = Player2(player2, board, row)
                printBoard(row, col, board)
                win = Win(player2, row, board, col, win)
                if(win == True):
                    print('Player 2 has won the game!')
                draw = Draw(board, col, win, draw)
                if(draw == True):
                    print("It's a draw")
    else:
        while(win == False and draw == False):
            print('Player 1 what is your choice?')
            print('Enter a column to place your peice in (1-', col,'):', end='')
            player1 = int(input())
            player1 = inputValidation(player1, col, board)
            baord = Player1(player1, board, row)
            printBoard(row, col, board)
            win = Win(player1, row, board, col, win)
            if(win == True):
                print('Player 1 has won the game!')
            draw = Draw(board, col, win, draw)
            if(draw == True):
                print("It's a draw")
            if(win == False and draw == False):
                print("It is the computer's turn.")
                num = randint(1, col)
                while(board[0][num-1] != '-'):
                    num = randint(1,col)
                print("The computer chose column:", num)
                board = Computer(board, row, col, num)
                printBoard(row, col, board)
                win = Win(num, row, board, col, win)
                if(win == True):
                    print('The computer has won!')
                draw = Draw(board, col, win, draw)
                if(draw == True):
                    print("It's a draw")
    playAgain = answerValidation(playAgain, 0)
    if(playAgain == 'y'):
        main()
    else:
        print("Thank you for playing!")
            
            

main()
