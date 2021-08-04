#ifndef _GRAPH
#define _GRAPH

#include <iostream>  // Standard screen i/o stuff
#include <string>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <tuple>

using namespace std;

//graph class
class Graph {
    public:
    //point class
        class Node{
                friend Graph;
                public:
                    Node(int name){
                        _name = name;
                    }
                    Node(const Node& rhs){
                        _name = rhs._name;
                    }
                private:
                    int _name;
                    vector<tuple<int,int>> edges;
        };
            //public methods
        Graph(int source);
        ~Graph();
        void addNode(int name);
        void addEdge(int name1,int name2, int cost);
        int getIndx(int name);
        void init();
        void cost_2D();
        void printCost();
        int nearest(int curr);
        void Dijkstra();
        void print();
    private:
        //member variables
        vector<Node*> nodes;
        vector<bool> visited;
        vector<int> distance;
        vector<int> prev;
        int source;
        int curr;
        int** cost;
        int size = 0;
        int costs = 0;
};

#endif