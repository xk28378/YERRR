//Title: Alchemist.cpp
//Author: Nem Negash
//Date: 2/27/2019

#include "Element.h" //Include for the element struct
#include "Alchemist.h"
#include <iostream>
#include <string>
#include <cstdlib>
#include <iomanip>
using namespace std;


// Name: Alchemist() - Default Constructor
  // Desc: Used to build a new Alchemist
  // Preconditions - Requires default values
  // Postconditions - Creates a new Alchemist
Alchemist::Alchemist() {
	m_myName = " ";
	m_attempts = 0;
	m_repeats = 0;
	m_numElements = 0;
}
// Name: Alchemist(name) - Overloaded constructor
  // Desc - Used to build a new Alchemist
  // Preconditions - Requires name
  // Postconditions - Creates a new Alchemist
Alchemist::Alchemist(string name) {
	m_myName = name;
	m_attempts = 0;
	m_repeats = 0;
	m_numElements = 0;
	m_myElements[PROJ2_SIZE] = {};
}
// Name: GetName()
  // Desc - Getter for Alchemist name
  // Preconditions - Alchemist exists
  // Postconditions - Returns the name of the Alchemist
string Alchemist::GetName() {
	return m_myName;
}
// Name: SetName(string)
  // Desc - Allows the user to change the name of the Alchemist
  // Preconditions - Alchemist exists
  // Postconditions - Sets name of Alchemist
void Alchemist::SetName(string name) {
	m_myName = name;
}
// Name: DisplayElements()
  // Desc - Displays a numbered list of all elements known by the Alchemist
  // Preconditions - Alchemist exist
  // Postconditions - None
void Alchemist::DisplayElements() {
	for (int i = 0; i < PROJ2_SIZE; i++) {
		if (m_myElements[i].m_name != "") {
			cout << i+1 << ". " << m_myElements[i].m_name << endl;
		}
	}
}
// Name: GetNumElements()
  // Desc - Returns number of elements known by the Alchemist
  // Preconditions - Alchemist exists
  // Postconditions - None
int Alchemist::GetNumElements() {
	int counter = 0;
	for (int i = 0; i < PROJ2_SIZE; i++) {
		if (m_myElements[i].m_name != "") {
			counter++;
		}
	}
	m_numElements = counter;
	return m_numElements;
}
// Name: CheckElement(Element)
  // Desc - Checks to see if the Alchemist has an element
  // Preconditions - Alchemist already has elements
  // Postconditions - Returns true if Alchemist has element else false
bool Alchemist::CheckElement(Element s) {
	bool exists = false;
	for (int i = 0; i < PROJ2_SIZE; i++) {
		if (m_myElements[i].m_name == s.m_name) {
			exists = true;
			AddRepeat();
		}
	}
	return exists;
}
// Name: AddElement(Element)
  // Desc - Adds element to m_myElements if not known increases numElements
  // Preconditions - Alchemist exists and new element not already known
  // Postconditions - Adds element to m_myElements
void Alchemist::AddElement(Element s) {
	bool exists = CheckElement(s);
	int count = 0;
	if (exists == false) {
		for (int i = 0; i < PROJ2_SIZE; i++) {
			if (m_myElements[i].m_name == "" && count == 0) {
				m_myElements[i] = s;
				count++;
			}
		}
	}
}
// Name: GetElement(int)
  // Desc - Checks to see if the alchemist has an element
  // Preconditions - Alchemist already has elements
  // Postconditions - Returns element at index
Element Alchemist::GetElement(int k) {
	return m_myElements[k];
}
// Name: AddAttempt
  // Desc - Increments attempts
  // Preconditions - Alchemist attempts a merge
  // Postconditions - Increments every time a merge is attempted
void Alchemist::AddAttempt() {
	m_attempts++;
}
// Name: GetAttempts()
  // Desc - Returns number of attempts for that Alchemist
  // Preconditions - Alchemist exists
  // Postconditions - Returns total number of attempts
int Alchemist::GetAttempts() {
	return m_attempts;
}
// Name: AddRepeat()
  // Desc - Increments repeats for every time an element has already been found
  // Preconditions - Alchemist attempts a merge
  // Postconditions - Increments every time a merge yields an element already found
void Alchemist::AddRepeat() {
	m_repeats++;
}
// Name: GetRepeats()
  // Desc - Returns number of repeats for that Alchemist
  // Preconditions - Alchemist exists
  // Postconditions - Returns total number of repeats
int Alchemist::GetRepeats() {
	return m_repeats;
}