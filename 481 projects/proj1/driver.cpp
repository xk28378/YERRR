#include <iostream>
#include <fstream>
#include <bits/stdc++.h> 
#include "EntryList.h"

using namespace std;

int main(int argv, char* argc[]){

    EntryList list;

    //load file from command line argument
    if(argv < 1 || argv > 2){
        cout << "Invalid number of parameters..." << endl;
        return -1;
    }
    
    cout << "Loading file: " << argc[1] << endl << endl;
    string filename = argc[1];
    list.file_input(filename);
    
    string user = " ";
    
    while(user != "QUIT"){
        cout << "Please enter a command(Type QUIT to end program and save to file): ";
        getline(cin, user);
        string command;
        stringstream line(user);
        line >> command;
        if(command == "Add" || command == "add"){
            list.add(user);
        }else if(command == "Update" || command == "update"){
            list.update(user);
        }else if(command == "Read" || command == "read"){
            list.read(user);
        }else if(command == "Search" || command == "search"){
            list.search1(user);
        }else if(command == "Delete" || command == "delete"){
            list._delete(user);
        }else if(command == "Print" || command == "print"){
            list.print();
        }else if(command == "QUIT"){
            list.save();
            break;
        }else{
            cout << "That is not a valid command. Please try again." << endl;
        }
    }

    return 0;
}