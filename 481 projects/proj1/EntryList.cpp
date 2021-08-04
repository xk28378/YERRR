#include "EntryList.h"
#include <bits/stdc++.h> 
using namespace std;

EntryList::EntryList() {
    _list = nullptr;
    _size = 0;
}

EntryList::EntryList(const EntryList& rhs) {
    if(rhs._size > 0){//checks if the entrylist is empty
        _size = rhs._size;
        _list = new Entry(*rhs._list);
        Entry *curr = rhs._list->_next; 
        Entry *curr2 = _list;
        for(;curr != nullptr; curr = curr->_next){//copies over from the sent entry list
        curr2->_next = new Entry(*curr);
        curr2 = curr2->_next; 
        }
    }else{//if sent entrylist is empty
        _list = nullptr;
        _size = 0;
    }
    
}

const EntryList& EntryList::operator=(const EntryList& rhs) {
    if(this != &rhs){//protects from self-assignment 
        if(rhs._size > 0){//checks if the entrylist is empty
            _size = rhs._size;
            _list = new Entry(*rhs._list);
            Entry *curr = rhs._list->_next; 
            Entry *curr2 = _list;
            for(;curr != nullptr; curr = curr->_next){//copies over from the sent entry list
            curr2->_next = new Entry(*curr);
            curr2 = curr2->_next; 
            }
        }else{//if sent entrylist is empty
            _list = nullptr;
            _size = 0;
        }
    }
    return *this;
}

EntryList::~EntryList() {
    Entry * temp = _list;
    for(int i = 0; i < _size; i++){
        Entry *temp2 = temp->_next;
        delete temp;
        temp = temp2;
    }
}

void EntryList::add(string dummy){
    stringstream info(dummy);
    string command,name,name1,department,id1,sub11,sub22,sub33;
    int id, sub1, sub2, sub3;
    info >> command;
    info >> name;
    info >> name1;
    info >> id1;
    info >> department;
    info >> sub11;
    info >> sub22;
    info >> sub33;
    name = name + " " +name1;
    try{
        id = stoi(id1);
        sub1 = stoi(sub11);
        sub2 = stoi(sub22);
        sub3 = stoi(sub33);
    }
    catch(exception &err){
        cerr << "Invalid ID, Subject Scores, or Name(First and Last name reqired)...\nID and Subject Scores must be numeric values." << endl;
        return;
    }

    if(id_check(id)){
        if(_list ==  nullptr){
            _list = new Entry(name, id, department, sub1, sub2, sub3);
        }else{
            Entry* curr = _list;
            while( curr->_next != nullptr){
                curr = curr->_next;
            }
            curr->_next = new Entry(name, id, department, sub1, sub2, sub3);
        }
        id_list.push_back(id);
        _size++;
    }else{
        cout << "The given ID already belongs to someone else..." << endl;
    }
    
}   

void EntryList::update(string dummy){
    stringstream info(dummy);
    string command, col_name, value; 
    int id;
    info >> command;
    info >> id;
    Entry *node = search(dummy);
    if(node == nullptr){
        return;
    }else{
        info >> col_name;
        info >> value;
        if(col_name == "Subject1" || col_name == "subject1"){
            int value2;
            try{
                value2 = stoi(value);
            }
            catch(exception &err){
                cout << "Invalid value for Subject1..." << endl;
                return;
            }
            node->_subject1 = value2;
        }else if(col_name == "Subject2" || col_name == "subject2"){
            int value2;
            try{
                value2 = stoi(value);
            }
            catch(exception &err){
                cout << "Invalid value for Subject2..." << endl;
                return;
            }
            node->_subject2 = value2;
        }
        else if(col_name == "Subject3" || col_name == "subject3"){
            int value2;
            try{
                value2 = stoi(value);
            }
            catch(exception &err){
                cout << "Invalid value for Subject3..." << endl;
                return;
            }
            node->_subject3 = value2;
        }else if(col_name == "Department" || col_name == "department"){
            node->_department = value;
        }else if(col_name == "Name" || col_name == "name"){
            string value1;
            info >> value1;
            if(value1.length() < 1){
                cout << "Need a first and last name..." << endl;
                return;
            }
            node->_name = value + " " + value1;
        }else{
            cout << "Invalid column name.\n Choose between Name, Department, Subject1, Subject2, Subject3" << endl;
            return;
        }
        node->updateScore();
    }
}

void EntryList::read(string dummy){
    stringstream info(dummy);
    string command, col_name, value; 
    int id;
    info >> command;
    info >> id;
    Entry *node = search(dummy);
    if(node == nullptr){
        return;
    }else{
        info >> col_name;
        info >> value;
        if(col_name == "Subject1" || col_name == "subject1"){
            cout << "Subject1: "  << node->_subject1 << endl;
        }else if(col_name == "Subject2" || col_name == "subject2"){
            cout << "Subject2: "  << node->_subject1 << endl;;
        }
        else if(col_name == "Subject3" || col_name == "subject3"){
            cout << "Subject3: "  << node->_subject1 << endl;
        }else if(col_name == "Department" || col_name == "department"){
            cout << "Department: "  << node->_department << endl;
        }else if(col_name == "Name" || col_name == "name"){
            cout << "Name: "  << node->_name << endl;
        }else if(col_name == "Score" || col_name == "score"){
            cout << "Score: "  << node->_score << endl;
        }else{
            cout << "Given column name is not valid..." << endl;
        }
        node->updateScore();
    }
}

EntryList::Entry* EntryList::search(string dummy){
    if(_list == nullptr){
        cout << "There are no students on record." << endl;
        return nullptr;
    }
    stringstream info(dummy);
    string command;
    int id;
    info >> command;
    info >> id;
    Entry *curr = _list;
    for(;curr != nullptr;curr = curr->_next){
        if(curr->_id == id){
            return curr;
        }
    }
    cout << "No student exists with the given ID(ID has to be a numeric value" << endl; 
    return nullptr;
}

void EntryList::search1(string dummy){
    Entry *temp = search(dummy);
    if(temp != nullptr){
        cout << "Name: " << temp->_name << " " << "ID: " << temp->_id << " " << "Department: " << temp->_department << " " << "Subject1: " << temp->_subject1 << " " << "Subject2: " << temp->_subject2 << " " << "Subject3: " << temp->_subject3 << " " << "Average Score: " << temp->_score << " " << endl;
    }
}

void EntryList::_delete(string dummy){
    Entry * prev = _list;
    Entry *curr = search(dummy);
    if(curr == nullptr){
        return;
    }else if (curr == _list){
        _list = curr->_next;
        cout << "Name: " << curr->_name << " " << "ID: " << curr->_id << " " << "Department: " << curr->_department << " " << "Subject1: " << curr->_subject1 << " " << "Subject2: " << curr->_subject2 << " " << "Subject3: " << curr->_subject3 << " " << "Score: " << curr->_score << " " << endl;
        delete curr;
    }else{
        Entry* ahead = curr->_next;
        while(prev->_next != curr){
            prev = prev->_next;
        }
        prev->_next = ahead;
        cout << "Delete Student: " << endl;
        cout << "Name: " << curr->_name << " " << "ID: " << curr->_id << " " << "Department: " << curr->_department << " " << "Subject1: " << curr->_subject1 << " " << "Subject2: " << curr->_subject2 << " " << "Subject3: " << curr->_subject3 << " " << "Score: " << curr->_score << " " << endl;
        delete curr;
    }
    _size--;
}

void EntryList::print(){
    cout << "Size: " << _size << endl;
    if(_list == nullptr){
        cout << "There are no entries" << endl;
    }else{
        Entry* curr = _list;
        for(int i = 0; i < _size;i++){
            cout << "Name: " << curr->_name << " " << "ID: " << curr->_id << " " << "Department: " << curr->_department << " " << "Subject1: " << curr->_subject1 << " " << "Subject2: " << curr->_subject2 << " " << "Subject3: " << curr->_subject3 << " " << "Score: " << curr->_score << " " << endl;
            curr = curr->_next;
        }
    }
}

void EntryList::save(){
    ofstream output;
    output.open("StudentData.txt");
    Entry* curr = _list;
    for(int i = 0; i < _size;i++){
        output << curr->_name << "   " << curr->_id << "   " << curr->_department << "   " << curr->_subject1 << "   " << curr->_subject1 << "   " << curr->_subject1<< "   " << curr->_score << endl;
        curr = curr->_next;
    }
    output.close();
}

bool EntryList::id_check(int n){
    if(id_list.empty()){
        return true;
    }else{
        if(find(id_list.begin(), id_list.end(), n) != id_list.end()){
            return false;
        }else{
        return true;
        }
 
    }
}

void EntryList::file_input(string filename){
    ifstream File;
    string name, name1, department, id, sub1,sub2,sub3;
    File.open(filename);
    int i = 0;
    while(File.peek() != EOF){
        File >> name >> name1 >> id >> department >> sub1 >> sub2 >> sub3;
        //cout << i << ": " << name << " "<< name1 << " "<< id << " "<< department << " "<< sub1 << " "<< sub2 << " "<< sub3 << endl;
        string input = name + " " + name + " " + name1 + " " + id + " " + department + " " + sub1 + " " + sub2 + " " + sub3;
        if(id_check(stoi(id))){
            add(input);
        }
        i++;
    }
    File.close();
}