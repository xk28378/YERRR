//Title: Game.cpp
//Author: Nem Negash
//Date: 2/27/2019

#include "Element.h" //Include for the element struct
#include "Alchemist.h"
#include "Game.h"
#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <iomanip>
using namespace std;

//constants
const int QUIT = 4;

/* Name: Game() Default Constructor
  // Desc - Builds a new game by: 
  // 1. Loads all Alchemy recipes into m_elements (by making elements)
  // 2. Asks user for their alchemist's name (store in m_myAlchemist as m_myName)
  // 3. Adds fire, water, air, and earth to m_myElements (in m_myAlchemist)
  // Preconditions - None
  // Postconditions - m_elements is populated
  */ 
Game::Game(){ //Default Constructor
	GameTitle();
	Alchemist m_myAlchemist;
	LoadElements();
	string name;
	cout << "What is the name of the Alchemist?" << endl;
	cin >> name;
	m_myAlchemist.SetName(name);
}
// Name: LoadElements
  // Desc -  Loads each element into m_elements from file
  // Preconditions - Requires file with valid element data
  // Postconditions - m_element is populated with element structs
void Game::LoadElements(){
	Element currElement;
	string currString;
	ifstream File;

    //takes in all elements from file
	File.open(PROJ2_DATA);
	for (int i = 0; i < PROJ2_SIZE; i++) {
		getline(File, currString, ',');
		currElement.m_name = currString;
		getline(File, currString, ',');
		currElement.m_element1 = currString;
		getline(File, currString, '\n');
		currElement.m_element2 = currString;
		m_elements[i] = currElement;
	}
	cout << "390 elements loaded." << endl;

    //assigns first 4 elements
	for (int i = 0; i < PROJ2_SIZE; i++) {
		if (m_elements[i].m_name == "Fire") {
			m_myAlchemist.AddElement(m_elements[i]);
		}
		if (m_elements[i].m_name == "Water") {
			m_myAlchemist.AddElement(m_elements[i]);
		}
		if (m_elements[i].m_name == "Air") {
        m_myAlchemist.AddElement(m_elements[i]);		
        }
		if (m_elements[i].m_name == "Earth") {
			m_myAlchemist.AddElement(m_elements[i]);
		}
	}
}
// Name: StartGame()
  // Desc - Manages the game itself including win conditions continually
  //         calling the main menu 
  // Preconditions - Player is placed in game
  // Postconditions - Continually checks to see if player has entered 5
void Game::StartGame(){
	int choice = 0;
	while(choice != QUIT){
		choice = MainMenu();
		switch (choice) {
			case 1:
			DisplayElements();
			break;
			case 2:
			CombineElements();
            m_myAlchemist.AddAttempt();
			break;
			case 3:
			CalcScore();
			break;
			case 4:
			cout << "Thanks for playing the Alchemist" << endl;
		}

	}
}
 // Name: DisplayMyElements()
  // Desc - Displays the current elements
  // Preconditions - Player has elements
  // Postconditions - Displays a numbered list of elements
void Game::DisplayElements(){
	m_myAlchemist.DisplayElements();
}
// Name: MainMenu()
  // Desc - Displays and manages menu
  // Preconditions - Player has an Alchemist
  // Postconditions - Returns number including exit
int Game::MainMenu(){
	int num;
	cout << "What would you like to do?" << endl;
	cout << "1. Display the Alchemist's Elements" << endl;	
	cout << "2. Attempt to Merge Elements" << endl;
	cout << "3. See score" << endl;
	cout << "4.quit" << endl;
	cin >> num;
    //input validation for choice
	while(num < 0 || num > QUIT){
		cout << "What would you like to do?" << endl;
		cout << "1. Display the Alchemist's Elements" << endl;	
		cout << "2. Attempt to Merge Elements" << endl;
		cout << "3. See score" << endl;
		cout << "4.quit" << endl;
		cin >> num;
	}
	return num;
}
// Name: CombineElements()
  // Desc - Attempts to combine known elements
  // Preconditions - Alchemist is populated with elements
  // Postconditions - May add element to Alchemist's list of elements
void Game::CombineElements(){
	string element1;
	string element2;
	
	int choice;
    //gets first element
	RequestElement(choice);
	element1 = m_myAlchemist.GetElement(choice).m_name;
    //gets second element
    RequestElement(choice);
	element2 = m_myAlchemist.GetElement(choice).m_name;
    //gets the index of the found element if element is found
	int index = SearchRecipes(element1, element2);
    //checks if index is valid
	if(index >= 0){
		m_myAlchemist.AddElement(m_elements[index-1]);
	}
}
// Name: RequestElement()
  // Desc - Requests element to use to merge
  // Preconditions - Alchemist has elements to try and merge
  // Postconditions - Returns
void Game::RequestElement(int &choice){
    int counter = 0;

    //finds how many known elements there is
	for(int i =0; i < PROJ2_SIZE; i++){
		if(m_myAlchemist.GetElement(i).m_name != ""){
		counter++;
	    }
	}
    cout << "Which elements would you like to merge?" << endl;
	cout << "To list known elements enter -1" << endl;
	cin >> choice;
	
    //input validation
	while(choice < 0 || choice > counter){
		if(choice == -1){
			DisplayElements();
			cout << "Which elements would you like to merge?" << endl;
			cout << "To list known elements enter -1" << endl;
			cin >> choice;
		}
		else{
			cout << "Which elements would you like to merge?" << endl;
			cout << "To list known elements enter -1" << endl;
			cin >> choice;
		}
	}
	choice--;
}
// Name: SearchRecipes()
  // Desc - Searches recipes for two strings
  // Preconditions - m_elements is populated
  // Postconditions - Returns int index of matching recipe
int Game::SearchRecipes(string element1, string element2){
	bool found  =  false;
	int counter = 0;
    //checks if new element is found
	while(counter < PROJ2_SIZE && found == false){
		if(m_elements[counter].m_element1 == element1 && m_elements[counter].m_element2 == element2){
			found = true;
		}
		if(m_elements[counter].m_element1 == element2 && m_elements[counter].m_element2 == element1){
			found = true;
		}
		counter++;
	}
    //checks if element has already been found
    if(found == true){
        for(int i = 0; i < PROJ2_SIZE; i++){
            if(m_myAlchemist.GetElement(i).m_name == m_elements[counter-1].m_name ){
                cout << "Already found " << m_elements[counter-1].m_name << endl;
                 m_myAlchemist.AddRepeat();
                return -1;//invalid index 
            }
        }
    }
    //nothing is found by the merge
	if(found == false){
		cout << "Nothing happened when you tried to combine " << element1 << " and " << element2 << endl;
		return -1;//invalid index
	}
    //returns the index of the found element 
    else{
		cout << element1 << " combined with " << element2 << " to make " << m_elements[counter-1].m_name << endl;
		cout << "The Alchemist now knows " <<  m_elements[counter-1].m_name << endl;
		return counter;//valid index
	}
}

// Name: CalcScore()
  // Desc - Displays current score for Alchemist
  // Preconditions - Alchemist is populated with elements
  // Postconditions - None
void Game::CalcScore(){
    //finds the number of known elements
	double counter = 0;
	for(int i =0; i < PROJ2_SIZE; i++){
		if(m_myAlchemist.GetElement(i).m_name != ""){
		counter++;
		}
	}
    //finds the percentage 
	double percent = (counter/PROJ2_SIZE)*100;
    //prints score
	cout << "***The Alchemist***" << endl;
	cout << "The Great Alchemist " << m_myAlchemist.GetName() << endl;
	cout << "The Alchemist has tried to combine " << m_myAlchemist.GetAttempts() << " elements" << endl;
    cout << "The Alchemist has repeated attempyts " << m_myAlchemist.GetRepeats() << " times" << endl;
    cout << "The Alchemist found " << int(counter) << " out of 390 elements." << endl;
    cout << "You have completed " << fixed << setprecision(2) <<  percent << "% of the elements." << endl;
}