#include "Graph.h"
#include <iostream>  // Standard screen i/o stuff
#include <string>
#include <sstream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <ctype.h>
#include <tuple>

bool isNumber(const string& str)//checks to see if a string is a number
{
    for (char const &c : str) {
        if (isdigit(c) == 0) return false;
    }
    return true;
}

//returns a valid source input from the user
int source_input(){
    string in_source;
    cout << "Source Node: ";
    getline(cin,in_source);
    //input validation
    while(!isNumber(in_source)){
        cout << "Invalid input, integer values only and NO SPACES" << endl;
        cout << "Source Node: ";
        cin >> in_source;
    }
    int source = stoi(in_source);
    return source;
}

bool repeat_check(int x, vector<int> y){
    bool check = false;
    //cout << "list" << y.size() << endl;
    //loop to check each node in y
    for(int i = 0; i < y.size();i++){
        //cout << y[i] << endl;
        //if there is a value in the vector as the x
        if(y[i] == x){
            //there is a repeat
            check = true;
            //cout << "repeat made" << endl;
        }
    }
    //cout << "end" << endl;
    return check;
}

//gets valid nodes input from the user, returns null if invalid input
vector<int>* nodes_input(){
    string nodes;
    cout << "Set of nodes V = ";
    getline(cin,nodes);
    //make sure there is no spaces
    for(int i = 0; i < nodes.length();i++){
        //cout << edges[i] << endl;
        if(isblank(nodes[i])){
            return NULL;
        }
    }
    //make sure first char of sting is '{'
    while(nodes[0] != '{'){
        cout << "Invalid input for set of nodes, input format: {0,1,2,3}" << endl;
        cout << "Set of nodes V = ";
        getline(cin,nodes);
    }
    vector<int> *setofNodes = new vector<int>;
    string parse;
    stringstream input(nodes);
    //parses the user input
    while(getline(input,parse,',')){
        //cout << parse.length() << " " << parse<<endl;
        if(parse[0] == '{'){//if it is the first parse
            parse.erase(0,1);
            //cout << "after erase: " << parse << endl;
            if(!isNumber(parse)){//make sure it is a number
                return NULL;
            }else{
                //make sure there are no repeats
                if(!repeat_check(stoi(parse),*setofNodes)){
                    setofNodes->push_back(stoi(parse));
                }else{
                    return NULL;
                }
                
            }
        }else if(parse[parse.length()-1] == '}'){//if it is the last parse
            parse.erase(parse.length()-1,parse.length());
            //cout << "after erase: " << parse << endl;
            if(!isNumber(parse)){//make sure it is number
                return NULL;
            }else{
                //make sure there are no repeats
                if(!repeat_check(stoi(parse),*setofNodes)){
                    setofNodes->push_back(stoi(parse));
                }else{
                    return NULL;
                }
            }
            
        }else{//for all nodes in the middle
            if(!isNumber(parse)){//make sure it is a number
                return NULL;
            }else{
                //make sure there are no repeats
                if(!repeat_check(stoi(parse),*setofNodes)){
                    setofNodes->push_back(stoi(parse));
                }else{
                    return NULL;
                }
            }
        }
    }
    /*
    cout << "The list" << size << endl;
    for(int i = 0; i < size; i++) {
        cout << setofNodes[i] << endl;
    }
    cout << "end of list" << endl;*/
    return setofNodes;
}

//make sure x is in the list of nodes
bool edge_node(int x,vector<int> nodes){
    bool check = false;
    for(int i = 0; i < nodes.size();i++){//loop through nodes vector
        if(x == nodes[i]){//check if there is a repeat
            //cout << "they are in the list node" << endl;
            check = true;
        }
    }
    return check;
}

//check to see if the source node(x) is in the list of nodes
bool source_check(int x, vector<int>& y){
    bool check = false;
    //cout << "size" << y.size() << endl;
    for(int i = 0; i < y.size();i++){//loop through nodes vector
        //cout << y[i] << endl;
        if(y[i] == x){//check if each one is equal to source node(x)
            check = true;
        }
    }
    return check;
}

//check if given edge is repeated
bool edge_checker(vector<tuple<int,int,int>>& x, tuple<int,int,int> y){
    bool check = false;
    for(int i = 0; i < x.size();i++){//loop through vector of edges
        //check if there is a edge in the vector similar to x
        if((get<0>(x[i]) == get<0>(y) && get<1>(x[i]) == get<1>(y)) || (get<0>(x[i]) == get<1>(y) && get<1>(x[i]) == get<0>(y))){
            check = true;
        }
    }
    return check;
}

//gets edges list input from user using tuples returns NULL for invalid input
vector<tuple<int, int, int>>* edges_input(vector<int>& nodes){
    string edges;
    cout << "Set of edges E = ";
    getline(cin,edges);
    //cout << edges << endl;
    //check for spaces in user input
    for(int i = 0; i < edges.length();i++){
        //cout << edges[i] << endl;
        if(isblank(edges[i])){
            return NULL;
        }
    }
    //make sure user input starts with '{('
    while(edges[0] != '{' || edges[1] != '('){
        cout << "Invalid input for set of edges, input format: {(node,node,cost),(node,node,cost)}, no repeating Edges and NO SPACES" << endl;
        cout << "Set of edges E = ";
        getline(cin,edges);
    }
    vector<tuple<int,int,int>> *setofEdges = new vector<tuple<int,int,int>>;
    string parse;
    stringstream input(edges);

    //parse each edge
    while(getline(input,parse,')')){
        //cout << "the parse: " << parse << endl;
        if(parse[0] == ','){//get rid of the commas
            parse.erase(0,1);
        }
        //if its the first edge of the list
        if(parse[0] == '{'){
            parse.erase(0,1);
            //cout << "after erase: " << parse << endl;
            string parse1;
            stringstream input1(parse);
            tuple<int,int,int> temp(-1,-1,-1);
            //parse each value of the edge 
            int count = 0;
            while(getline(input1,parse1,',')){
                count++;
                //cout << "the split parse: " << parse1 << endl;
                //if its the first value of the edge
                if(parse1[0] == '('){
                    parse1.erase(0,1);
                    if(!isNumber(parse1)){//make sure it is a number
                        cout << "error1" << endl;
                        return NULL;
                    }else{
                        if(edge_node(stoi(parse1),nodes)){//checking to see if node of edges is in the list of nodes
                            get<0>(temp) = stoi(parse1);
                        }else{
                            return NULL;
                        }
                        
                    }
                
                }else if(parse1[parse1.length()-1] == ')'){//last value of edge
                    parse1.erase(parse1.length()-1,parse1.length());
                    //cout << "after erase: " << parse << endl;
                    if(!isNumber(parse1)){//check to see it it is a number
                        cout << "error2" << endl;
                        return NULL;
                    }else{
                        get<2>(temp) = stoi(parse1);
                    }
                
            
                }else{//if it is the middle value of a edge
                    if(!isNumber(parse1)){//make sure it is a number
                        cout << "error3" << endl;
                        return NULL;
                    }else{
                        if(get<1>(temp) == -1){//check to see if second node of edge has been saved
                            if(edge_node(stoi(parse1),nodes)){//make sure node 2 of edge value is in list of nodes
                                get<1>(temp) = stoi(parse1);
                            }else{
                                return NULL;
                            }
                        }else{//setr cost
                            get<2>(temp) = stoi(parse1);
                        }
                        
                    }

                }
                
                
            }
            //cout << count << endl;
            //make sure there are 3 numeric values for each edge
            if(count != 3){
                    //if(parse1.length() > 1){
                        return NULL;
                   // }
            }
            //making sure the parse is longer than 2
            if(parse.length() > 2){
                if(get<0>(temp) == get<1>(temp)){//check if node1 and node2 of edge are equal
                    cout << get<0>(temp) << get<1>(temp) << endl;
                    cout << "error4" << endl;
                    return NULL;
                }else{
                    if(!edge_checker(*setofEdges,temp)){//make sure edge is not repeated
                        setofEdges->push_back(temp);
                    }else{
                        return NULL;
                    }
                }
            }
            
        }else if(parse[parse.length()-1] == '}'){//last part of edge user input
            parse.erase(parse.length()-1,parse.length());//delete last part
            //cout << "after erase: " << parse << endl;
            //code is the same for first edge
            string parse1;
            stringstream input1(parse);
            tuple<int,int,int> temp(-1,-1,-1);
            int count = 0;
            while(getline(input1,parse1,',')){
                count++;
                //cout << "lower parse" << parse1;
                if(parse1[0] == '('){
                    parse1.erase(0,1);
                    if(!isNumber(parse1)){
                        cout << "error5" << endl;
                        return NULL;
                    }else{
                        if(edge_node(stoi(parse1),nodes)){
                            get<0>(temp) = stoi(parse1);
                        }else{
                            return NULL;
                        }
                    }
                
                }else if(parse1[parse1.length()-1] == ')'){
                    parse1.erase(parse1.length()-1,parse1.length());
                    //cout << "after erase: " << parse << endl;
                    if(!isNumber(parse1)){
                        cout << "error6" << endl;
                        return NULL;
                    }else{
                        get<2>(temp) = stoi(parse1);
                    }
                
            
                }else{
                    if(!isNumber(parse1)){
                        cout << "error7" << endl;
                        return NULL;
                    }else{
                        if(get<1>(temp) == -1){
                            if(edge_node(stoi(parse1),nodes)){
                                get<1>(temp) = stoi(parse1);
                            }else{
                                return NULL;
                            }
                        }else{
                            get<2>(temp) = stoi(parse1);
                        }
                        
                    }

                }
                
            }
            //cout << count << endl;
            if(count != 3){
                if(parse1.length() > 1){
                    return NULL;
                }
            }
            if(parse.length() > 2){
                if(get<0>(temp) == get<1>(temp)){
                    cout << get<0>(temp) << get<1>(temp) << endl;
                    cout << "error8" << endl;
                    return NULL;
                }else{
                    if(!edge_checker(*setofEdges,temp)){
                        setofEdges->push_back(temp);
                    }else{
                        return NULL;
                    }
                    
                }
            }
            
    
        }else{
            //code is the same from above
            string parse1;
            stringstream input1(parse);
            tuple<int,int,int> temp(-1,-1,-1);
            int count = 0;
            while(getline(input1,parse1,',')){
                count++;
                //cout << "low parse: " << parse1 << endl;
                if(parse1[0] == '('){
                    parse1.erase(0,1);
                    if(!isNumber(parse1)){
                        cout << "error9" << endl;
                        return NULL;
                    }else{
                        if(edge_node(stoi(parse1),nodes)){
                            get<0>(temp) = stoi(parse1);
                        }else{
                            return NULL;
                        }
                    }
                
                }else if(parse1[parse1.length()-1] == ')'){
                    parse1.erase(parse1.length()-1,parse1.length());
                    //cout << "after erase: " << parse << endl;
                    if(!isNumber(parse1)){
                        cout << "error10" << endl;
                        return NULL;
                    }else{
                        get<2>(temp) = stoi(parse1);
                    }
                
            
                }else{
                    if(!isNumber(parse1)){
                        cout << "error11" << endl;
                        return NULL;
                    }else{
                        if(get<1>(temp) == -1){
                            if(edge_node(stoi(parse1),nodes)){
                                get<1>(temp) = stoi(parse1);
                            }else{
                                return NULL;
                            }
                        }else{
                            get<2>(temp) = stoi(parse1);
                        }
                        
                    }

                }
                
            }
            //cout << count << endl;
            if(count != 3){
                //if(parse1.length() > 1){
                    return NULL;
                //}
            }
            if(parse.length() > 2){
                if(get<0>(temp) == get<1>(temp)){
                    cout << get<0>(temp) << get<1>(temp) << endl;
                    cout << "error12" << endl;
                    return NULL;
                }else{
                    if(!edge_checker(*setofEdges,temp)){
                        setofEdges->push_back(temp);
                    }else{
                        return NULL;
                    }
                }
            }
            
        }
    }
    //cout << setofEdges->size() << endl;
    /*for(int i = 0; i < setofEdges->size();i++){
        cout << i << ": " << get<0>(*setofEdges[i]) << " " << get<1>(*setofEdges[i])<< " " <<get<2>(*setofEdges[i]) << endl;
        
    }*/
    return setofEdges;
    
}

//prints the edge vectors
//just a helper fucntions used in writing this project
void print(vector<tuple<int,int,int>>& x){
    cout << x.size() << endl;
    for(int i = 0; i < x.size();i++){
        cout << i << ": " << get<0>(x[i]) << " " << get<1>(x[i])<< " " <<get<2>(x[i]) << endl;
        
    }
}

//main fucntion
int main(){
    //get user input for source
    int source = source_input();
    
    //get user input for nodes vector
    vector<int>* setOfNodes = nodes_input();
    Graph*g1 = new Graph(source);
    //input validation
    while(setOfNodes == NULL || !source_check(source,*setOfNodes)){
        //cout << source_check(source,*setOfNodes) << endl;
        cout << "Invalid input for set of nodes, input format: {0,1,2,3}, source node MUST be listed again, no repeating Nodes and NO SPACES " << endl;
        setOfNodes = nodes_input();
    }

    //add each node from the user input to the graph
    for(int i = 0; i < setOfNodes->size();i++){
        g1->addNode(setOfNodes->at(i));
    }

    //ger user input for edges vector
    vector<tuple<int,int,int>>* setOfEdges = edges_input(*setOfNodes);
    //input validation
    while(setOfEdges == NULL){
        //cout << source_check(source,*setOfNodes) << endl;
        cout << "Invalid input for set of edges, input format: {(node,node,cost),(node,node,cost)}, no repeating Edges and NO SPACES" << endl;
        setOfEdges = edges_input(*setOfNodes);
    }
    //make a local temp vector of edges to add to graph
    vector<tuple<int,int,int>> temp = *setOfEdges;
    //add each edge to graph
    for(int i = 0; i < setOfEdges->size();i++){
        g1->addEdge(get<0>(temp[i]),get<1>(temp[i]),get<2>(temp[i]));
    }
    //initialize
    g1->init();
    //create cost 2d list
    g1->cost_2D();
    /*cout << "COST LIST" << endl;
    g1->printCost();
    cout << "COST LIST END" << endl;*/
    //call Dijkstra's algorithm fucntion
    g1->Dijkstra();
    //print output
    g1->print();
    //print(*setOfEdges);
    delete g1;
    delete setOfNodes;
    delete setOfEdges;

}
