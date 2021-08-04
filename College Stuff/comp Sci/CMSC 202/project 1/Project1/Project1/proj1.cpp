/*# File: proj1.cpp
# Author: Nem Negash
# Date: 02/16/19
# Section: Section 07
# E-mail: xk28378@umbc.edu*/

#include <iostream>
#include <fstream>
using namespace std;

/*constants*/
const int MAX_SIZE = 75;
const int USER[7] = { 1, 2, 3, 4, 5, 6 };
const int INVERT_NUM = 37;

/*function prototypes*/
void mainMenu(int num);
void prettyPrint(char artArray[][MAX_SIZE + 1]);
void rotateArray(char artArray[][MAX_SIZE + 1], int rotate);
int inputValidation(int num, int menu);


int main() {
	cout << "Welcome to the ASCII Art tool" << endl;
	/*creates art Arry and user input of main menu*/
	char artArray[MAX_SIZE + 1][MAX_SIZE + 1] = { " " };
	int user = 0;
	/*used to decided how many times its been rotated*/
	int rotate = 0;
	/*filename, the indexes of the figure and the figure*/
	char myFileName[MAX_SIZE] = " ";
	int findex;
	int sindex;
	char figure[2] = " ";
	/*used for when the user wants to add a character manually*/
	int x;
	int y;
	char newFigure[2] = " ";
	/*gets the user's choice of inversion and holds the character to siwtch */
	int user2;
	char hold[2] = " ";
	ifstream File;
	/*while loop until the user wants to exit*/
	while (user != USER[5]) {
	  mainMenu(1);
	  cin >> user;
	  user = inputValidation(user,1);
		/*switch that holds the cases for each user choice*/
		switch (user) {
		case 1:
			/*gets the file name from the user*/
			cout << "What is the files name:";
			cin >> myFileName;
			cout << endl;
			File.open(myFileName);
			/*input validation to make sure the file is opened*/
			while(!File){
			  cout << "Can't open that file try another file name(don't forget .txt)."<< endl;
			  cout << "What is the files name:";
			  cin >> myFileName;
			  cout << endl;
			  File.open(myFileName);
			}
			/*takes in the characters from th etext file and places them in the art array*/
			if (File.is_open()) {
				while (File >> findex) {
					File >> sindex >> figure[1];
					artArray[findex][sindex] = figure[1];
				}
			}
			File.close();
			cout << "Done" << endl;
			break;
		case 2:
			/*takes in the x and y from the user and places the figure at that location*/
			cout << "This will modify the current art" << endl;
			cout << "Enter the X corrdinate between 0 and 75:" << endl;
			cin >> x;
			/*input validation for x*/
			x = inputValidation(x, USER[2]);
			cout << "Enter the Y corrdinate between 0 and 75:" << endl;
			cin >> y;
			/*input validation for y*/
			y = inputValidation(y,USER[2]);
			cout << "Enter the character for that location:" << endl;
			cin >> newFigure[1];
			artArray[x][y] = newFigure[1];
			break;
		case 3:
			/*checks if the user has rotated the image*/
			if (rotate != 0) {
				rotateArray(artArray, rotate);
			}
			/*if not rotated prints it as it is*/
			else {
				prettyPrint(artArray);
			}
			break;
		case 4:
			/*for every time the user ask to rotates it keeps track*/
			rotate += 1;
			if (rotate == USER[3]) {
				rotate = 0;
			}
			break;
		case 5:
			/*asks the user if they want to invert horizontally or vertically*/
			mainMenu(USER[1]);
			cin >> user2;
			/*input validation, makes sure the user chooses 1 or 2*/
			user2 = inputValidation(user2, USER[1]);
			if (user2 == 1) {
				/*inverts vertically*/
				for (int i = 0; i <= MAX_SIZE; i++) {
					for (int j = 0; j <= INVERT_NUM; j++) {
						hold[1] = artArray[j][i];
						artArray[j][i] = artArray[MAX_SIZE - j][i];
						artArray[MAX_SIZE - j][i] = hold[1];
					}
				}
			}
			if (user2 == USER[1]) {
				/*inverts vertically*/
				for (int i = 0; i <= MAX_SIZE; i++) {
					for (int j = 0; j <= INVERT_NUM; j++) {
						hold[1] = artArray[i][j];
						artArray[i][j] = artArray[i][MAX_SIZE - j];
						artArray[i][MAX_SIZE- j] = hold[1];
					}
				}
			}
			
		case 6:
			/*exits */
			cout << "Thank you for using the ASCII Art Tool" << endl;
			break;
		}
	}
}

/*void mainMenu(int num)
INPUT:the menu num
OUTPUT:prints the correct menu*/
  void mainMenu(int num) {
	  if (num == USER[0]) {
		  /*prints main menu*/
		  cout << "1. Load ASCII Art form File" << endl;
		  cout << "2. Create ASCII Art Manually" << endl;
		  cout << "3. Display Art" << endl;
		  cout << "4. Rotate Art" << endl;
		  cout << "5. Invert Art" << endl;
		  cout << "6. Exit" << endl;
	  }
	  if (num == USER[1]) {
		  /*prints invert menu*/
		  cout << "Would you like to invert it horizontally or vertically? " << endl;
		  cout << "1. Vertically" << endl;
		  cout << "2. Horizonatally" << endl;
	  }
}
/*void prettyPrint(char artArray[][]
INPUT:art array
OUTPUT: prints art array*/
void prettyPrint(char artArray[][MAX_SIZE + 1]){
	/*rpints out art array*/
  for (int i=0;i <= MAX_SIZE; i++){
    for (int j = 0; j <= MAX_SIZE; j++){
      if(artArray[i][j] == NULL){
	cout << " ";
      }
      else{
	cout << artArray[i][j];
      }
    }
    cout << endl;
  }
}
/*void rotateArray(char artArray[][], int rotate)
INPUT: the art array and trh number of times rotated
OUTPUT: prints the arry depending on how many times rotated*/
void rotateArray(char artArray[][MAX_SIZE + 1], int rotate) {
	if (rotate == 1 ) {
		/*prints array if only rotated once*/
		for (int i = 0; i <= MAX_SIZE; i++) {
			for (int j = MAX_SIZE; j >= 0; j--) {
				if (artArray[j][i] == NULL) {
					cout << " ";
				}
				else {
					cout << artArray[j][i];
				}
			}
			cout << endl;
		}
	}
	if (rotate == USER[1] ) {
		/*prints array if rotated in twice*/
		for (int i = MAX_SIZE; i >= 0; i--) {
			for (int j = MAX_SIZE; j >= 0; j--) {
				if (artArray[i][j] == NULL) {
					cout << " ";
				}
				else {
					cout << artArray[i][j];
				}
			}
			cout << endl;
		}
	}
	if (rotate == USER[2]) {
		for (int i = MAX_SIZE; i >= 0; i--) {
			/*prints array if rotated three times*/
			for (int j = 0; j < MAX_SIZE; j++) {
				if (artArray[j][i] == NULL) {
					cout << " ";
				}
				else {
					cout << artArray[j][i];
				}
			}
			cout << endl;
		}
	}
	if (rotate == 0) {
		/*if rotated 4 times ts back to normal so prints array as is*/
		prettyPrint(artArray);
	}
}
/*int inputValidtion(int num, int menu)
INPUT: the user choice and the menu they choose from
OUTPUT: returns the correct user choice*/
int inputValidation(int num, int menu) {
	if (menu == USER[0]) {
		/*makes sure the user selects between 1 and 6 for the main menu*/
		while (num < 0 || num > USER[5]) {
			mainMenu(menu);
			cin >> num;
		}
	}
	if (menu == USER[1]) {
		/*makes sure the user only chooses 1 or 2 for the invert menu*/
		while (num != USER[0] && num != USER[1]) {
			mainMenu(menu);
			cin >> num;
		}
	}
	if(menu = USER[2]){
	  while(num > MAX_SIZE){
		  /*makes sure the sure the user stays in the array range when editing manually*/
	    cout << "Corrdinate has to be between 0 and 75" << endl;
	    cin >> num;
	  }
	}
	return num;
}
