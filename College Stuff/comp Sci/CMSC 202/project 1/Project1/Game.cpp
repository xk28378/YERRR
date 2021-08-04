//Title: Alchemist.cpp
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

Game::Game() {
	Alchemist m_myAlchemist;
	Element m_elements[PROJ2_SIZE] = {};
	Element currElement;
	string currString;
	ifstream File;
	File.open(PROJ2_DATA);
	for (int i = 0; i < PROJ2_SIZE; i++) {
		for (int j = 0; j < 3; j++) {
			getline(File, currString, ',');
			if (j == 0) {
				currElement.m_name = currString;
			}
			if (j == 1) {
				currElement.m_element1 = currString;
			}
			if (j == 2) {
				currElement.m_element2 = currString;
			}
		}
		m_elements[i] = currElement;
		cout << currElement.m_name << currElement.m_element1 << currElement.m_element2 << endl;

	}
	string name;
	cout << "What is the name of the Alchemist?" << endl;
	cin >> name;
	m_myAlchemist.SetName(name);
	for (int i = 0; i < PROJ2_SIZE; i++) {
		if (m_elements[i].m_name == "Fire") {
			m_myAlchemist.GetElement(0) = m_elements[i];
		}
		if (m_elements[i].m_name == "Water") {
			m_myAlchemist.GetElement(1) = m_elements[i];
		}
		if (m_elements[i].m_name == "Air") {
			m_myAlchemist.GetElement(2) = m_elements[i];
		}
		if (m_elements[i].m_name == "Earth") {
			m_myAlchemist.GetElement(3) = m_elements[i];
		}
	}

}
void Game::LoadElements(){
	cout << "fun"<< endl;
}
void Game::StartGame(){
	cout << "it works" << endl;
}
void Game::DisplayElements(){
	int counter = 0;
	while(m_myAlchemist.GetElement(counter).m_name != " " and counter < PROJ2_SIZE){
		cout << counter + 1 << ". " << m_myAlchemist.GetElement(counter).m_name<< endl;
	}
}
int Game::MainMenu(){
	int num;
	cout << "What would you like to do?" << endl;
	cout << "1. Display the Alchemist's Elements" << endl;	
	cout << "2. Attempt to Merge Elements" << endl;
	cout << "3. See score" << endl;
	cout << "4.quit" << endl;
	cin >> num;
	return num;
}
void Game::CombineElements(){
	string element1;
	string element2;
	int choice;
	cout << "Which elements would you like to merge?" << endl;
	cout << "To list known elements enter -1" << endl;
	cin >> choice;
	while(choice == -1){
		DisplayElements();
		cout << "Which elements would you like to merge?" << endl;
		cout << "To list known elements enter -1" << endl;
		cin >> choice;
	}
	element1 = m_myAlchemist.GetElement(choice-1).m_name;
	cout << "Which elements woukd you like to merge?" << endl;
	cout << "To list known elements enter -1" << endl;
	cin >> choice;
	while(choice == -1){
		DisplayElements();
		cout << "Which elements woukd you like to merge?" << endl;
		cout << "To list known elements enter -1" << endl;
		cin >> choice;
	}
	element2 = m_myAlchemist.GetElement(choice-1).m_name;
	int index = SearchRecipes(element1, element2);
	if(index >= 0){
		m_myAlchemist.AddElement(m_elements[index]);
	}
}
void Game::RequestElement(int &choice){
	cout << choice << endl;
}

int Game::SearchRecipes(string element1, string element2){
	bool found  =  false;
	int counter = 0;
	while(counter < PROJ2_SIZE && found == false){
		if(m_elements[counter].m_element1 == element1 && m_elements[counter].m_element2 == element2){
			found = true;
		}
		if(m_elements[counter].m_element1 == element2 && m_elements[counter].m_element2 == element1){
			found = true;
		}
		counter++;
	}
	if(found == true){
		cout << "Nothing happened when you tried to combine " << element1 << " and " << element2 << endl;
		return -1;
	}else{
		cout << element1 << " combined with " << element2 << " to make " << m_elements[counter].m_name << endl;
		return counter;
	}
}
void Game::CalcScore(){
	int counter = 0;
	while(m_myAlchemist.GetElement(counter).m_name != " " and counter < PROJ2_SIZE){
		counter++;
	}
	int percent = (counter/PROJ2_SIZE)*100;
	cout << percent << endl;
}