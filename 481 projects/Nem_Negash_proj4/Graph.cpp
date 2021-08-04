#include "Graph.h"
using namespace std;

#define INF 9999

//constructor
Graph::Graph(int _source){
    source = _source;
}

//deconstructor
Graph::~Graph(){
    for(int i = 0; i < nodes.size();i++){
        delete nodes[i];
    }
    for(int i = 0; i < size;i++){
        delete[] cost[i];
    }
    delete[] cost;
    
}

//adds nodes to the graph
void Graph::addNode(int name){
    //make new node
    Node* temp = new Node(name);
    nodes.push_back(temp);
    size++;
}

//adds edges to the nodes of the graph
void Graph::addEdge(int name1, int name2, int cost){
    //add edge to first node
    nodes[getIndx(name1)]->edges.push_back(make_tuple(name2,cost));
    //add edge to second node
    nodes[getIndx(name2)]->edges.push_back(make_tuple(name1,cost));
    costs++;
}

//returns the index of the node passed
int Graph::getIndx(int name){
    for(int i = 0; i < size;i++){
        if(nodes[i]->_name == name){//checks to see if name is in list of nodes
            return i;
        }
    }
    return -1;
}

//set up the costs array and the distance and visited vectors
void Graph::init(){
    cost = new int*[size];
    //set all costs to infinity 
    for(int i = 0; i < size;i++){
        cost[i] = new int[size];
        for(int j = 0; j < size; j++){
            cost[i][j] = INF;
        }
    }
    //set all nodes to unvisited and infinity distance
    for(int i = 0;i < size;i++){
        visited.push_back(false);
        distance.push_back(INF);
        prev.push_back(i);
    }
    //set source to 0 distance
    distance[getIndx(source)] = 0;
    curr = getIndx(source);
}

//adds the cost of all edges into costs 2d array 
void Graph::cost_2D(){
    for(int i  = 0; i < size;i++){
        cost[i][i] = 0;
        for(int j = 0; j < nodes[i]->edges.size();j++){
            cost[i][getIndx(get<0>(nodes[i]->edges[j]))] = get<1>(nodes[i]->edges[j]);
        }
    }
}

//just a helper function used in development to print cost array
void Graph::printCost(){
    for(int i = 0; i < size;i++){
        //cout << nodes[i]->_name << endl;
        for(int j = 0; j < size;j++){
            cout << cost[i][j] << '\t';
        }
        cout << endl;
    }
}

//finds the closest node to the current node with the lowest cost
int Graph::nearest(int curr){
    int min = INF;
    int indx = 0;
    int curr_cost = 0;
    for(int i = 0; i < size; i++){
        if(!visited[i] && cost[curr][i] < min){
            min = cost[curr][i];
            indx = i;
        }
    }
    return indx;
}

//does the dijksta alogrithm
void Graph::Dijkstra(){
    //loops through each node
    for(int i = 0; i < size; i++){
        int near =  nearest(curr);//find nearest
        curr = near;
        visited[near] = true;
        for(int j = 0; j < size;j++){
            //if node near is connected to any other node and the distance is lessthan the distance already there save new distance
            if(cost[curr][j] != INF && distance[j] > distance[near] + cost[near][j]){
                distance[j] = distance[near] + cost[near][j];//update distance
                prev[j] = near;
            }   
        }
    }
}

//prints all the output of the program 
void Graph::print(){
    //prints the graph details
    cout << "------------------GRAPH DETAILS------------------" << endl;
    cout << "Total number of Nodes: " << size << endl;
    cout << "Total number of Edges: " << costs << endl << endl;
    cout << "List of edges and cost for each node:\n" << endl;

    //loop to print edges for each node
    for(int i = 0;i < size;i++){
        cout << "List of edges and cost for Node " << nodes[i]->_name << ":" << endl;
        for(int j = 0; j < nodes[i]->edges.size();j++){
            cout << "Edge " << j+1 << ": Node = " << get<0>(nodes[i]->edges[j]) << " Cost = " << get<1>(nodes[i]->edges[j]) << endl;
        }
        cout << endl;
    }

    //to print out the node path and cost for each node
    cout << "Node Paths from Source node table:" << endl;
    cout <<"Node:\t\t\tCost: \t\t\tPath" << endl;
    //loops for all nodes of graph

    for(int i = 0; i < size;i++){
        cout << nodes[i]->_name << "\t\t\t";
        //if there is an edge connected to node
        if(distance[i] != INF){
            cout << distance[i] << "\t\t\t ";
        }else{//no edge connected to node
            cout << "∞ \t\t\t ";
        }

        //path set up
        cout << nodes[i]->_name << " ";
        int parent = prev[i];
        bool check = true;

        //making sure if current node is not the source
        if(nodes[i]->_name != source){
            //loop until end of path
            while(check){
            if(check)
                cout << "  <-- " << nodes[parent]->_name;
                //if source node has been reached
                if(nodes[parent]->_name == source || nodes[i]->edges.size() == 0){
                    check = false;
                }
                parent = prev[parent];
            }
        }
        cout << endl << endl;
    }

    //displaying forwarding table
    cout << "Forwarding Table:\n" << endl;
    cout << "Destination |   link" << endl;
    cout << "-------------------" << endl;
    //goes through each node of the graph
    for(int i = 0; i < size;i++){
        //check to make sure the source node is not added to the table and 
        //the current node has edges connected to it
        if(i != getIndx(source) && nodes[i]->edges.size() != 0){
            cout << nodes[i]->_name << "\t    |  (" << source << ",";
            int parent = prev[i];
            int parent1 =  prev[i];
            for(int i = 0; i < size; i++){//find the next node after the source node
                while(nodes[parent]->_name != source){
                    parent1 = parent;
                    parent = prev[parent];

                }
            }
            //if node is adjacent to source node
            if(nodes[parent1]->_name == source){
                cout << nodes[i]->_name << ")" << endl;
            }else{
                cout << nodes[parent1]->_name << ")" << endl;
            }
            
        }else{//if current node is source node or node has no edges
            if(nodes[i]->edges.size() == 0){//if surrent node has no edges
                cout << nodes[i]->_name << "\t    |  (" << nodes[i]->_name << "," << nodes[i]->_name << ")" << endl;
            }
        }
    }
}

