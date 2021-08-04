#ifndef _ENTRY_LIST
#define _ENTRY_LIST

#include <iostream>  // Standard screen i/o stuff
#include <string>
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

//graph class
class Graph {
    public:
    //point class
    class Node{
            friend Graph;
            public:
                Node(string name, int type){
                    _type = type;
                    _name = name;
                }
                Node(const Node& rhs){
                    _name = rhs._name;
                    _type = rhs._type;
                }
            private:
                string _name = " ";
                int _type = 0;
                vector<Node*> _connect;
        };
        Graph(string name);
        ~Graph();
        void CreateGraph();
        void print();
    private:
        string _name;
        vector<Node*> Layer1;
        vector<Node*> Layer2;
        vector<Node*> Layer3;
};

#endif