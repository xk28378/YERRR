#ifndef _ENTRY_LIST
#define _ENTRY_LIST

#include <iostream>  // Standard screen i/o stuff
#include <string>
#include <vector>
#include <algorithm>
#include <fstream>
using namespace std;

class EntryList{
    public:
        class Entry{
            friend EntryList;
            public:
                Entry(string name, int id, string department, int subject1, int subject2, int subject3){
                    _name = name;
                    _id = id;
                    _department = department;
                    _subject1 = subject1;
                    _subject2 = subject2;
                    _subject3 = subject3;
                    _score = (subject1 + subject2 + subject3)/3;
                    _next = nullptr;
                }
                Entry(const Entry& rhs){
                    _name = rhs._name;
                    _id = rhs._id;
                    _department = rhs._department;
                    _subject1 = rhs._subject1;
                    _subject2 = rhs._subject2;
                    _subject3 = rhs._subject3;
                    _score = (_subject1 + _subject2 + _subject3)/3;
                    _next = nullptr;
                }
                void updateScore(){
                    _score = (_subject1 + _subject2 + _subject3)/3;
                }
            private:
                string _name = " ";
                int _id = 0;
                string _department = " ";
                int _subject1 = 0;
                int _subject2 = 0;
                int _subject3 = 0;
                int _score = 0;
                Entry * _next;
        };

        EntryList();

        EntryList(const EntryList& rhs);

        const EntryList& operator=(const EntryList& rhs);

        ~EntryList();

        void add(string dummy);

        void update(string dummy);

        void read(string dummy);

        Entry* search(string dummy);

        void _delete(string dummy);

        void print();

        void search1(string dummy);

        void save();

        bool id_check(int n);

        void file_input(string filename);
    
    private:
        Entry *_list;
        int _size;
        vector<int> id_list;
};

#endif