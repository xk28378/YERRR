#include "Graph.h"
using namespace std;

Graph::Graph(string name){
    _name = name;
}

Graph::~Graph(){
    for(int i = 0; i < 10;i++){
        Node * temp = Layer1[i];
        delete temp;
    }
    for(int i = 0; i < 20;i++){
        Node * temp = Layer2[i];
        delete temp;
    }
    for(int i = 0; i < 40;i++){
        Node * temp = Layer3[i];
        delete temp;
    }
}

void Graph::CreateGraph(){
    //layer1
    for(int i = 0;i < 10;i++){
        string name = "A"+ to_string(i+1);
        Node * temp = new Node(name,1);
        Layer1.push_back(temp);
    }

    //layer2
     for(int i = 0;i < 20;i++){
        string name = "B"+ to_string(i+1);
        Node * temp = new Node(name,2);
        Layer2.push_back(temp);
    }

    //layer3
     for(int i = 0;i < 40;i++){
        string name = "C"+ to_string(i+1);
        Node * temp = new Node(name,3);
        Layer3.push_back(temp);
    }
    
    //layer 1 to layer 2
    for(int i = 0;i < 10;i++){
        int size = (rand() % 3) +3;
        int indx = (rand() % 20) +1;
        Node* temp = Layer1[i];
        for(int j = 0; j < size;j++){
            if(indx == 20){
                indx = 0;
                temp->_connect.push_back(Layer2[indx]);
            }else{
                temp->_connect.push_back(Layer2[indx]);
            }
            indx++;
        }
    }

    //layer 2 to layer 1
    for(int i = 0;i < 20;i++){
        int indx = (rand() % 10) +1;
        Node* temp = Layer2[i];
        for(int j = 0; j < 2;j++){
            if(indx == 10){
                indx = 0;
                temp->_connect.push_back(Layer1[indx]);
            }else{
                temp->_connect.push_back(Layer1[indx]);
            }
            indx++;
        }
    }

    //layer 2 to layer 3
    for(int i = 0;i < 20;i++){
        int size = (rand() % 3) +3;
        int indx = (rand() % 40) +1;
        Node* temp = Layer2[i];
        for(int j = 0; j < size;j++){
            if(indx == 40){
                indx = 0;
                temp->_connect.push_back(Layer3[indx]);
            }else{
                temp->_connect.push_back(Layer3[indx]);
            }
            indx++;
        }
    }

    //layer 3 to layer 2
    for(int i = 0;i < 40;i++){
        int indx = (rand() % 20) +1;
        Node* temp = Layer3[i];
        for(int j = 0; j < 2;j++){
            if(indx == 20){
                indx = 0;
                temp->_connect.push_back(Layer2[indx]);
            }else{
                temp->_connect.push_back(Layer2[indx]);
            }
            indx++;
        }
    }
}


void Graph::print(){
    //print layer 1 to 2
    cout << "Layer 1 to 2:" << endl;
    for(int i = 0; i < 10; i++){
        cout << "A" << i+1 << "->";
        cout << Layer1[i]->_connect[0]->_name;
        for(int j = 1; j < Layer1[i]->_connect.size();j++){
            cout << "," << Layer1[i]->_connect[j]->_name;
        }
        cout << endl;
    }
    cout << endl;

    //print layer 2 to 1
    cout << "Layer 2 to 1:" << endl;
    for(int i = 0; i < 20; i++){
        cout << "B" << i+1 << "->";
        if(Layer2[i]->_connect[0]->_type == 1){
            cout << Layer2[i]->_connect[0]->_name;
        }
        for(int j = 1; j < Layer2[i]->_connect.size();j++){
            if(Layer2[i]->_connect[j]->_type == 1){
                cout << "," << Layer2[i]->_connect[j]->_name;
            }
        }
        cout << endl;
    }
    cout << endl;

    //print layer 2 to 3
    cout << "Layer 2 to 3:" << endl;
    for(int i = 0; i < 20; i++){
        cout << "B" << i+1 << "->";
        if(Layer2[i]->_connect[0]->_type == 3){
            cout << Layer2[i]->_connect[0]->_name;
        }
        for(int j = 1; j < Layer2[i]->_connect.size();j++){
            if(Layer2[i]->_connect[j]->_type == 3){
                cout << "," << Layer2[i]->_connect[j]->_name;
            }
        }
        cout << endl;
    }
    cout << endl;

    //layer 3 to 2
    cout << "Layer 3 to 2:" << endl;
    for(int i = 0; i < 40; i++){
        cout << "C" << i+1 << "->";
        cout << Layer3[i]->_connect[0]->_name;
        for(int j = 1; j < Layer3[i]->_connect.size();j++){
            cout << "," << Layer3[i]->_connect[j]->_name;
        }
        cout << endl;
    }
    cout << endl;
}