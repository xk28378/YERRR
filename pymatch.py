import random

#*****************************
#I decided to write comments so it makes more sense to you ps: please delete the comments cause there is nothing professional about them :)
#*****************************


#this just gets the main function just gets the shit it needs from the user like the row,col and seed and the file name to get the game started
def main():
  info = input("Enter Row, Columns, Seed: ").split(',')
  while not validGameSetUp(info):
    print("Invalid input");
    info = input("Enter Row, Columns, Seed: ").split(',')
  row = int(info[0])
  col = int(info[1])
  seed = int(info[2])
  #here I just read the file with the get values function
  values = getValues()
  random.seed(seed)
  #this is creating the board using what we read
  board = getBoard(row,col,values)
  count = {}
  #creating a dictionary that keeps track of how many of each letters there are
  #you can just add print statements to see what the count dicrionary is.
  for i in range(row):
    for j in range(col):
      if board[i][j] not in count.keys():
        count[board[i][j]] = 0
      count[board[i][j]] += 1
  #call the game function that basically does everything else
  playGame(board,count)

#reads in the data from the file the user gave
def getValues():
  input_file = input("Enter symbol file name: ")
  f = open(input_file)
  shapes = f.readline()
  f.close()
  shapes = shapes.split()
  return shapes

#creates the game board using the symbols we read in from the user
def getBoard(row, col, symbols):
  board = [''] * row #this means create a list of length 'row' that is filled with ''
  for i in range(row):
    board[i] = [''] * col
  for i in range(row):
    for j in range(col):
      board[i][j] = random.choice(symbols)
  return board

#this just prints the board, it has a seen 2d array identical to the board in size and just keeps track of which ones should be 
# just stars/dots vs which ones should be the actual symbols
def print_board(board,seen):
  row = len(board)
  col = len(board[0])
  for i in range(row):
    for j in range(col):
      if seen[i][j]:
        print(board[i][j], end = " ")
      else:
        print(".",end = " ")
    print("\n")

#this just checks if the user has won and it uses the count to see if all the symbols are set to 0
def checkWin(count):
  for key in count:
    if count[key] > 0:
      return False
  return True

#checks if the user input is correct for when they are giving us a valid row, col, seed 
def validGameSetUp(user_input):
  if len(user_input) != 3 or not user_input[0].isdigit() or not user_input[1].isdigit() or not user_input[1].isdigit() or int(user_input[0]) <= 0 or int(user_input[1]) <= 0:
    return False
  return True

#checks if the position the user passed is within the bounds of the board
def validPostion(user_input,row,col):
  if len(user_input) != 2 or not user_input[0].isdigit() or not user_input[1].isdigit() or int(user_input[0]) <= 0 or int(user_input[0]) > row or int(user_input[1]) <= 0 or int(user_input[1]) > col:
    return False
  return True

#this is where the magic happens 
def playGame(board,count):
  row = len(board)
  col = len(board[0])
  #this is where we keep track if the symbol should be a star/dot or the actual symbol
  seen = [False] * row
  for i in range(row):
    seen[i] = [False] * col
  #this keeps track of all the symbols you have found that are all the same and reset when you mess up or when you find all of them
  stack = []
  while not checkWin(count):
    print_board(board,seen)
    line = ""
    #if they haven't found one yet
    if len(stack) == 0:
      line = "Enter a position to guess: "
    else:#if they have already found one symbol of many
      line = "Enter a position to guess that matches " + board[stack[-1][0]][stack[-1][1]] + ", there are " + str(count[board[stack[-1][0]][stack[-1][1]]]) + " remaining: "
    user_input = input(line).split()
    #make sure the user input is a valid postion
    while not validPostion(user_input,row,col):
      print("Invalid position!")
      user_input = input(line).split()
    #this is just a funky way of assiging the values in the userinput to variables
    #the line below is the same shit as this:
    #r = user_input[0]
    #c = user_input[1]
    [r,c] = user_input
    r = int(r)-1
    c = int(c)-1
    #make sure they haven't already picked this spot
    if seen[r][c]:
      print("You have already picked that spot.")
    else:
      #set seen for the position
      seen[r][c] = True
      #if they aready found other symbols and the one they just picked doesn't match the ones they picked before
      if len(stack) > 0 and board[stack[-1][0]][stack[-1][1]] != board[r][c]:
        print("No match this time:")
        print_board(board,seen)
        print("Try Again!")
        #go back and unsee all the ones they have picked thus far cause they fucked up
        while len(stack) > 0:
          [x,y] = stack.pop()
          count[board[x][y]] += 1
          seen[x][y] = False
        seen[r][c] = False
      else:#if this is their first pick or if they picked something that matches with the shit they have picked before
        stack.append([r,c])
        count[board[r][c]] -= 1
        #if the count for that symbol is 0 that means they have found all of them on the board.
        if count[board[r][c]] == 0:
          print("You have found all the", board[r][c])
          stack = []
  #if the loop ends that mean they have won 
  print_board(board,seen)
  print("Congratulations, You have won!!!!")
    
main()