#include <iostream>  
#include <string>
#include <sstream>
#include <bitset>
#include <math.h>
#include <tuple>
#include <vector>
#include <algorithm>

using namespace std;

//user input function
int input_fun(){
    string parse,user_input = " ";
    int output = 0;
    //chooses which user input to ask
    cout << "Enter M(x) = ";
    //take in user input
    cin >> user_input;
    stringstream input(user_input);
    //parses the user input
    while(getline(input,parse,'+')){
        if(parse.length() == 3){
            string temp1  = "";
            if(parse[0] == 'x' and parse[1] == '^'){
                temp1 = temp1 + parse[2];
                int temp = stoi(temp1);
                output  = output + pow(2,temp);
            }else{
                return 0;
            }
        }else if(parse.length() == 1){
            if(parse == "1"){
                output = output + 1;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }
    return output;
}
//takes in numeric vaues and outputs a binary value vector
vector<int> binary_vector(int x){
    vector<int> out;
    //loop to get binary values
    while(x > 0){
        if(x % 2 == 1){
            out.push_back(1);
            x = x/2;
        }else{
            out.push_back(0);
            x = x/2;
        }
    }
    return out;
}
//takes in binary vector outputs binary string
string binary_string(vector<int> x){
    string out = "";
    //loop to concatenate each index of the vector to string
    for(int i = 0; i < int(x.size()); i++){
        if(x[i] == 1){
            out  = out + "1";
        }else{
            out  = out + "0";
        }
    }
    return out;
}
//turns string backwards
string back(string x){
    string out = "";
    for(int i  = x.length()-1; i > -1;i--){
        out = out + x[i];
    }
    return out;
}
//takes in binary string and outputs binary vector
vector<int> string_vector(string x){
    vector<int> out;
    //loop that takes each index of string and adds it to the vector
    for(int i = 0; i < x.length();i++){
        if(x[i] == '1'){
            out.push_back(1);
        }else{
            out.push_back(0);
        }
    }
    return out;
}
//divides two binary vectors
tuple<string,string> divide(vector<int> num,vector<int> den){
    string temp = "";
    string q = "";
    int count = 1;
    //the divison loop
    while(den.size() <= num.size() && num.size() > 0){
        if(num[0] == 1){//dividend has to starts with one
            for(int i = 0;i < int(den.size());i++){//subtraction
                if((num[i] == 1 and  den[i] == 1) or (num[i] == 0 and  den[i] == 0)){
                    num[i] = 0;
                }else{
                    num[i] = 1;
                }
            }
            vector<int> temp1;
            //shifting loop
            for(int i = 1; i < num.size();i++){
                temp1.push_back(num[i]);
            }
            num = temp1;
            if(num.size() > 0){
                temp = temp + binary_string(num);
                q = q + "1";
            }else{
                vector<int> temp1;
                for(int i = 1; i < num.size();i++){
                    temp1.push_back(num[i]);
                }
                num = temp1;
                temp = temp + binary_string(num);
                q = q + "0";
            }
        }else{
            //shfting loop to find first one of dividend
            vector<int> temp1;
            for(int i = 1; i < num.size();i++){
                temp1.push_back(num[i]);
            }
            num = temp1;
            q = q + "0";
        }
        
    }
    // return quotient and remainder
    return make_tuple(q,binary_string(num));
}
//binary addition
string sub(vector<int> a, vector<int> b){
    string out = "";
    //setup for alignment 
    //if first value is larger than second 
    if(a.size() > b.size()){
        int dif = a.size() - b.size();
        for(int i = a.size()-1;i > dif-1;i--){
            if((a[i] == 1 and  b[i-dif] == 1) or (a[i] == 0 and  b[i-dif] == 0)){
                a[i] = 0;
            }else{
                a[i] = 1;
            }
        }
        out = binary_string(a);
    }else{//if second value is largerf f sfsdf 
        int dif = b.size() - a.size();
        for(int i = b.size()-1;i > dif-1;i--){
            if((b[i] == 1 and  a[i-dif] == 1) or (b[i] == 0 and  a[i-dif] == 0)){
                b[i] = 0;
            }else{
                b[i] = 1;
            }
        }
        out = binary_string(b);
    }
    return out;
}
//takes in bianry string and outputs polynomial string
string string_poly(string x){
    string out = "";
    //loops through binary string
    for(int i = 0;i < x.length();i++){
        if(i < x.length()-1){//if the exponent of the index is greater than zero
            if(x[i] == '1'){
                if(out.empty()){
                    out = out + "x^ " + to_string(x.length()-1-i);
                }else{
                    out = out + " + x^" + to_string(x.length()-1-i);
                }
            }
        }else{//if index exponent is zero
            if(x[i] == '1'){
                out = out + " + 1";
            }
        }
    }
    return out;
}

string odd_flip(string x){
    int count = 0;
    for(int i = x.length()-1;i > -1; i--){
        if(count % 2 == 0){
            if(x[i] == '1'){
                x[i] = '0';
            }else{
                x[i] = '1';
            }
        }
        count++;
    }
    return x;
}

int main(){
    int check = input_fun();
    while(check == 0){
        cout << "Invalid input for M(X)...please try again" << endl;
        check = input_fun();
    }
    vector<int> m_x = string_vector(back(binary_string(binary_vector(check))));
    string e_x;
    vector<int> g_x{1,0,0,0,0,0,1,1,1};
    //calculating N and K
    int K = m_x.size() - 1;
    int N = K + 8;
    cout << endl << "N = " << N << endl;
    cout << "K = " << K << endl << endl;
    cout << "-------------Sender--------------" << endl << endl;
    for(int i = 0; i < 8; i++){
        m_x.push_back(0);
    }
    //calculating q(x) and r(x)
    string q_x = get<0>(divide(m_x,g_x));
    string r_x = get<1>(divide(m_x,g_x));
    cout << "m_x: " << binary_string(m_x) << endl;

    cout << "Q(x) = " << string_poly(q_x) << endl <<"R(x) = " << string_poly(r_x) << endl;
    //calcualting c(x)
    string c_x = sub(string_vector(r_x),m_x);
    cout << "C(x) = " << string_poly(c_x) << c_x << endl << endl;

    cout << "------------Receiver-------------" << endl << endl;
    //calculating t(x)
    string t_x = odd_flip(c_x);
    cout << "T(x) =  " << string_poly(t_x) << t_x << endl;
    //calculate t(x)/g(x)
    cout << "T(x)/G(x) = " << string_poly(get<0>(divide(string_vector(t_x),g_x))) << endl;
    //converting e(x) into binary string
    cout << "E(x) = " << string_poly(sub(string_vector(t_x),string_vector(c_x))) << sub(string_vector(t_x),string_vector(c_x)) << endl;
    return 0;
}

