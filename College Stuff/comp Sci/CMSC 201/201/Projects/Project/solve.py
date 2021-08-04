##################################
#### DO NOT TOUCH THESE LINES ####
from random import randint, seed #
#seed(100)                       #
##################################
N = 9
S = 6
T = 3
NUMLIST = [1, 2, 3, 4, 5, 6, 7, 8, 9]
POSITIONLIST = [0, 1, 2, 3, 4, 5, 6, 7, 8]


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



def rowPossible(board):
    rowNumList = []
    for i in range(len(board)):
        valueList = NUMLIST[:]
        for j in range(len(board[i])):
            if board[i][j] in valueList:
                valueList.remove(board[i][j])
        rowNumList.append(valueList[:])
        
    return rowNumList



def colPossible(board):
    colNumList = []
    for j in range(len(board)):
        valueList = NUMLIST[:]
        for i in range (N):
            if board[i][j] in valueList:
                valueList.remove(board[i][j])
        colNumList.append(valueList[:])
        
    return colNumList


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
                                 
                                 



def Solve(board, win):
    check = False
    
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
        if row < 3:
            if col < 3:
                box = 0
            if col < 6 and col >= 3:
                box = 1
            if col >= 6:
                box = 2
        if row >= 3 and row < 6:
            if col < 3:
                box = 3
            if col < 6 and col >= 3:
                box = 4
            if col >= 6:
                box = 5
        if row >= 6:
            if col < 3:
                box = 6
            if col < 6 and col >= 3:
                box = 7
            if col >= 6:
                box = 8
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
            check = Check(board, check)
            if check == False:
                i -= 1
                
                
            
    

    

    print(board)
    print()
    print(openCells)
    print()
    print(rowNumList)
    print()
    print(colNumList)
    print()
    print(boxNumList)
    print()
    print(cellNums)

        
                    


def Check(solvepuzzle, check):
    rowcheck = False
    colcheck = False
    boxcheck = False

    count = 0
    count2 = 0
    for i in range(len(solvepuzzle)):
        rowList = NUMLIST[:]
        for j in range (len(solvepuzzle[i])):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in rowList:
                rowList.remove(solvepuzzle[i][j])
        if len(rowList) == 0:
            count += 1
    count += count2
    if count == 9:
        rowcheck = True
    else:
        rowcheck = False



    count = 0
    count2 = 0
    for i in range(len(solvepuzzle)):
        colList = NUMLIST[:]
        for j in range (N):
            if solvepuzzle[j][i] == 0:
                count2 += 1
            if solvepuzzle[j][i] in colList:
                colList.remove(solvepuzzle[j][i])
        if len(colList) == 0:
            count += 1
    count += count2
    if count == 9:
        colcheck = True
    else:
         colcheck = False




    count = 0
    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1

    count2 = 0
    boxList = NUMLIST[:]
    for i in range (T):
        for j in range(T):
            if solvepuzzle[i][j] == 0:
                count2 += 1
            if solvepuzzle[i][j] in boxList:
                boxList.remove(solvepuzzle[i][j])
                count2 += 1
    if len(boxList) == 0 or count2 == 9:
        count += 1
        
    
    if count == 9:
        boxcheck = True
    else:
        boxcheck = False


    if rowcheck == True and colcheck == True and boxcheck == True:
        check = True
    else:
        check = False

    return check











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








def main():
    win = False
    filename = input('Enter the filename of the Sudoku puzzle:')
    board = readFile(filename)
    Solve(board, win)


main()
