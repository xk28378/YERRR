# File: proj3.py
# Author: Nem Negash
# Date: 12/5/18
# Section: Section 12
# E-mail: xk28378@umbc.edu
# Description: Sudoku project

##################################
#### DO NOT TOUCH THESE LINES ####
from random import randint, seed #
#seed(100)                       #
##################################
#constants
N = 9
S = 6
T = 3
NUMLIST = [1, 2, 3, 4, 5, 6, 7, 8, 9]
POSITIONLIST = [0, 1, 2, 3, 4, 5, 6, 7, 8]

#def readFile(filename):
	#takes in the file
	#reads it and stores it in a list 
	#returns list
#INPUT: file
#OUTPUT: the board list
def readFile(filename):
    board = []
    inputfile = open(filename)
    board = inputfile.readlines()
    inputfile.close()
    for i in range(len(board)):
        board[i] = board[i].strip()
        board[i] = board[i].split(',')
        for j in range(len(board[i])):
            board[i][j]= int(board[i][j])
            
    return board

# savePuzzle(board, filename) 
#		writes the contents a sudoku puzzle out
#               to a file in comma separated format
# Input:        board;the square 2d puzzle (of integers) to write to a file
#              fileName; the name of the file to use for writing to
def savePuzzle(board, fileName):
    ofp = open(fileName, "w")
    for i in range(len(board)):
        rowStr = ""
        for j in range(len(board[i])):
            rowStr += str(board[i][j]) + ","
        # don't write the last comma to the file
        ofp.write(rowStr[ : len(rowStr)-1] + "\n")
    ofp.close()

# def prettyPrint(board) 
#		prints the board with row and column labels,
#               and spaces the board out so that it looks nice
# Input:        board;   the square 2d game board (of integers) to print
# Output:       None;    prints the board in a pretty way
def prettyPrint(board):
    # print column headings and top border
    print("\n    1 2 3 | 4 5 6 | 7 8 9 ") 
    print("  +-------+-------+-------+")

    for i in range(len(board)): 
        # convert "0" cells to underscores  (DEEP COPY!!!)
        boardRow = list(board[i]) 
        for j in range(len(boardRow)):
            if boardRow[j] == 0:
                boardRow[j] = "_"

        # fill in the row with the numbers from the board
        print( "{} | {} {} {} | {} {} {} | {} {} {} |".format(i + 1, 
                boardRow[0], boardRow[1], boardRow[2], 
                boardRow[3], boardRow[4], boardRow[5], 
                boardRow[6], boardRow[7], boardRow[8]) )

        # the middle and last borders of the board
        if (i + 1) % 3 == 0:
            print("  +-------+-------+-------+")


#def play(board, row, col, num):
	#takes in the board
	#appends num into the specified spot
	#returns board
#INPUT:board, row, col, num
#OUTPUT: newboard
def play(board, row, col, num):
    board[row-1][col-1] = num
    return board

#def undo(undoList, board):
	#all the values in the undo list are row and col values
	#takes the last list in the undolist
	#makes the value at cell = '_'
	#return board
#INPUT: undolist, board
#OUTPUT: new board
def undo(undoList, board):
    undorow = undoList[len(undoList)-2]
    undocol = undoList[len(undoList)-1]
    num = board[undorow-1][undocol-1]
    print('Removed the', num, 'you played at position (',undorow,',', undocol,').')
    board[undorow-1][undocol-1] = 0

    return board

#def correctness(board, solved board, row, col):
	#checks if the value at that cell in the board
	#if the same as the one in the solved board
	#returns boolean flag
#INPUT:board, solved board, row, col
#OUTPUT: true or false
def correctness(board, solvepuzzle, row, col, correct):
    if(board[row][col] == solvepuzzle[row][col]):
        correct = True
    else:
        correct = False

    return correct

#def findCells(board):
        #takes in the board
        #finds all the empty cells
        #appends the corrdinates into a list
        #returns that list
#INPUT: board
#OUTPUT: cell list
def findCells(board):
    openCells = []
    for i in range(len(board)):
        for j in range (len(board[i])):
            currcell = []
            if board[i][j] == 0:
                currcell.append(i)
                currcell.append(j)
                openCells.append(currcell)
    return openCells


#def rowPossible(board):
        #finds the possible numbers for each row
        #appends them into a list
        #returns the list
#INPUT: board
#OUTPUT: rowNumList
def rowPossible(board):
    rowNumList = []
    for i in range(len(board)):
        valueList = NUMLIST[:]
        for j in range(len(board[i])):
            if board[i][j] in valueList:
                valueList.remove(board[i][j])
        rowNumList.append(valueList[:])
        
    return rowNumList


#def colPossible(board):
        #finds the possible numbers for each column
        #appends them into a list
        #returns the list
#INPUT: board
#OUTPUT: colNumList
def colPossible(board):
    colNumList = []
    for j in range(len(board)):
        valueList = NUMLIST[:]
        for i in range (N):
            if board[i][j] in valueList:
                valueList.remove(board[i][j])
        colNumList.append(valueList[:])
        
    return colNumList

#def boxPossible(board):
        #finds the possible numbers for each 3x3 box
        #appends them into a list
        #returns the list
#INPUT: board
#OUTPUT: boxNumList
def boxPossible(board):
    boxNumList = []
    currBoxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])
    
    currBoxList = NUMLIST[:]    
    for i in range (T):
        for j in range(T,S):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])
    
    currBoxList = NUMLIST[:]    
    for i in range (T):
        for j in range(S,N):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])
    
    currBoxList = NUMLIST[:]
    for i in range (T,S):
        for j in range(T):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])

    currBoxList = NUMLIST[:]
    for i in range (T,S):
        for j in range(T,S):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])

    currBoxList = NUMLIST[:]
    for i in range (T,S):
        for j in range(S,N):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])

    currBoxList = NUMLIST[:]
    for i in range (S,N):
        for j in range(T):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])

    currBoxList = NUMLIST[:]
    for i in range (S,N):
        for j in range(T,S):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])

    currBoxList = NUMLIST[:]
    for i in range (S,N):
        for j in range(S,N):
            if board[i][j] in currBoxList:
                currBoxList.remove(board[i][j])
    boxNumList.append(currBoxList[:])

    return boxNumList
                                 
                                 


#def Solve(board):
	#takes in the board 
	#solves the puzzle or some of it
	#returns solved puzzle
#INPUT: game baord
#OUTPUT: solved game board or partly solved game board
def Solve(board):
    rowcheck = False
    colcheck = False
    boxcheck = False
    
    backup = [x[:] for x in board]
    openCells = findCells(board)
    rowNumList = rowPossible(board)
    colNumList = colPossible(board)
    boxNumList = boxPossible(board)
    cellNums = []
    box = 0
        
    for i in range (len(openCells)):
        row = openCells[i][0]
        col = openCells[i][1]
        valueList = NUMLIST[:]
        currCellNums = []
        if row < T:
            if col < T:
                box = POSITIONLIST[0]
            if col < S and col >= T:
                box = POSITIONLIST[1]
            if col >= S:
                box = POSITIONLIST[2]
        if row >= T and row < S:
            if col < 3:
                box = POSITIONLIST[3]
            if col < S and col >= T:
                box = POSITIONLIST[4]
            if col >= S:
                box = POSITIONLIST[5]
        if row >= S:
            if col < T:
                box = POSITIONLIST[6]
            if col < S and col >= T:
                box = POSITIONLIST[7]
            if col >= S:
                box = POSITIONLIST[8]
        for i in range (len(valueList)):
            if ((valueList[i] in rowNumList[row]) and (valueList[i] in colNumList[col]) and (valueList[i] in boxNumList[box])):
                currCellNums.append(valueList[i])
                colNumList[col].remove(valueList[i])
                rowNumList[row].remove(valueList[i])
                boxNumList[box].remove(valueList[i])
        cellNums.append(currCellNums[:])



    for i in range (len(openCells)):
        row = openCells[i][0]
        col = openCells[i][1]
        if len(cellNums[i]) > 0:
            num = randint(0,(len(cellNums[i])-1))
            while cellNums[i][num] == 0:
                num = randint((len(cellNums[i])-1))
            board[row][col] = cellNums[i][num]
            rowcheck = rowCheck(board)

    if rowcheck == True:
        return board
    else:
        return Solve(board)


    



    
        

#def rowcheck(board):
    #takes in the puzzle
    #checks if there is any repating nums in the row
    #returns true or false
#INPUT: board
#OUTPUT: true or false
def rowCheck(solvepuzzle):
    count = 0
    rowList = NUMLIST[:]
    for j in range (len(solvepuzzle[count])):
        if solvepuzzle[count][j] in rowList:
            rowList.remove(solvepuzzle[count][j])
        count += 1
    if count >= N:
        return True
    else:
        return False



#def colcheck(board):
    #takes in the puzzle
    #checks if there is any repating nums in the column
    #returns true or false
#INPUT: board
#OUTPUT: true or false    
def colCheck(solvepuzzle):
    count = 0 
    for i in range(len(solvepuzzle)):
        colList = NUMLIST[:]
        for j in range (N):
            if solvepuzzle[j][i] in colList:
                colList.remove(solvepuzzle[j][i])
        if len(colList) == 0:
            count += 1
    if count == 9:
        colcheck = True
    else:
         colcheck = False





    
   
#def boxcheck(board):
    #takes in the puzzle
    #checks if there is any repating nums in the 3x3 box
    #returns true or false
#INPUT: board
#OUTPUT: true or false
def boxCheck(solvepuzzle):
    count = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T,S):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(S,N):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (T,S):
        for j in range(T):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (T,S):
        for j in range(T,S):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (T,S):
        for j in range(S,N):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (S,N):
        for j in range(T):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (S,N):
        for j in range(T,S):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1

    boxList = NUMLIST[:]
    for i in range (S,N):
        for j in range(S,N):
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
    if len(boxList) == 0:
        count += 1
        
    
    if count == N:
        boxcheck = True
    else:
        boxcheck = False
    

#def main():
#	win = false
#	filename = user inputs file name
#	fileinput = opens the file
#	board = brings in the board from the file
#	solvepuzzle = deepcopy of board
#	solvepuzzle = Solve(solvepuzzle)
#	undolist = []
#	prettyPrint(board)
	#ask user if they want to play or solve
	#ask user if they want correctness if they choose to play
#	while(win = false):
		#print board
		#ask user if they want to play, solve or quitor undo
		#if they choose to play:
			#ask for row, column, and num to put in cell
			#append row and col to undo list
			#print board
			#win = Win(board, solvepuzzle)
#			if(win = true):
				#print"you win!"
		#if they choose to solve:
			#print solvepuzzle
			#win = true
		#if they choose to quit:
			#print'goodbye here is the final board
			#print the current board
			#win = true
		#if they choose to undo:
#			board = undo(undolist, board)


def main():
    count = 0
    board = []
    undoList = []
    Quit = False
    win = False
    correct = False
    filename = input('Enter the filename of the Sudoku puzzle:')
    board = readFile(filename)
    solvepuzzle = [x[:] for x in board]
    solvepuzzle = Solve(solvepuzzle)
    prettyPrint(board)
    play_solve = input('play(p) or solve(s)?:')
    while play_solve != 'p' and play_solve != 's':
        print('That is not a valid choice')
        play_solve = input('play(p) or solve(s)?:')
    if play_solve == 's':
        prettyPrint(solvepuzzle)
    if play_solve == 'p':
        correctness = input('correctness checking? (y/n):')
        while correctness != 'y' and correctness != 'n':
            print('That is not a valid choice')
            correctness = input('correctness checking? (y/n):')
        while win == False and Quit == False:
            prettyPrint(board)
            user = input('play number (p), save (s), undo (u), quit (q):')
            while user!= 'p' and user != 's' and user!= 'u' and user!= 'q':
                print('That is not a valid choice')
                user = input('play number(p), save (s), undo (u), quit (q):')
            if user == 'p':
                currentCell = []
                row = int(input('Enter a row number (1-9):'))
                col = int(input('Enter a column number (1-9):'))
                num = int(input('Enter a number to put in cell ({},{}):'.format(row,col)))
                undoList.append(row)
                undoList.append(col)
                board = play(board, row, col, num)
            if user == 'u':
                if len(undoList) == 0:
                    print('There are no moves to undo!')
                else:
                    board = undo(undoList, board)
                    undoList.remove(undoList[len(undoList)-2])
                    undoList.remove(undoList[len(undoList)-1])
            if user == 'q':
                print('Good bye! Here is the final board:')
                prettyPrint(board)
                Quit = True
            if user == 's':
                filename2 = input('Enter the filename you want to save to:')
                savePuzzle(board, filename2)
                
    



main()
    
