/*File: lab1b.cpp
# Author: Nem Negash
# Date: 1/19/19
# Section: Section 22
# E-mail: xk28378@umbc.edu */

#include <iostream>
using namespace std;

int main() {
  char name[80];
  int grade1;
  int grade2;
  int grade3;
  cout << "Enter your first name:" << endl;
  cin.getline(name, 80);
  cout <<"Enter your first grade:" << endl;
  cin >> grade1;
  cout <<"Enter your second grade:" << endl;
  cin >> grade2;
  cout << "Enter your third grade:" << endl;
  cin >> grade3;
  int total = grade3 + grade2 + grade1;
  double avg = total / 3.0;
  cout << name << " your average is " << avg << endl;
}
