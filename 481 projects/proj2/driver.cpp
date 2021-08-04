#include <iostream>
#include <fstream> 
#include "Graph.h"

using namespace std;

int main(){

    //make new graph
    Graph g1 = Graph("g1");
    //create graph
    g1.CreateGraph();
    //print
    g1.print();

    return 0;
}