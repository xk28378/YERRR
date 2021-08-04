#include <iostream>  
#include <string>
#include <sstream>
#include <bitset>
#include <math.h>
#include <stdlib.h>     /* srand, rand */
#include <time.h> 
#include <algorithm>

using namespace std;

//takes in binary 
string binary_string(int x){
    string out;
    //loop to get binary values
    while(x > 0){
        if(x % 2 == 1){
            out = out + "1";
            x = x/2;
        }else{
            out = out + "0";
            x = x/2;
        }
    }
    return out;
}

//takes in userinput and outputs encoded message
string encode(string userinput){
    string out = "0000000";
    int _xor = -1;
    //put in message bits
    out[3] = userinput[2];
    out[5] = userinput[1];
    out[6] = userinput[0];
    //calculate parity bits
    if(userinput[2] == '1'){
        _xor = 3;
    }
    if(userinput[1] == '1'){
        if(_xor != -1){
             _xor = _xor xor 5;
        }else{
            _xor = 5;
        }
       
    }
    if(userinput[0] == '1'){
        if(_xor != -1){
             _xor = _xor xor 6;
        }else{
            _xor = 6;
        }
       
    }
    bitset<3>bits(_xor);
    if(bits[0] == 1){
        out[1] = '1';
    }
    if(bits[1] == 1){
        out[2] = '1';
    }
    if(bits[2] == 1){
        out[4] = '1';
    }
    int count = 0;
    //set whole message parity bit
    for(int i = 0; i < out.length();i++){
        if(out[i] == '1'){
            count++;
        }
    }
    if(count %2 != 0){
        out[0] = '1';
    }
    return out;
}

void decode(string code){
    cout << "Recived code: " << code << endl;
    int x = -1;
    //check for one bit error
    for(int i = 1; i < code.length();i++){
        if(code[i] == '1'){
            if(x == -1){
                x = i;
            }else{
                x = x xor i;
            }
        }
    }
    //if there is at least one error in the message or partiy bits
    if(x != 0){
        int count = 0;
        //check if there is a double error
        for(int i = 0; i < code.length();i++){
            if(code[i] == '1'){
                count++;
            }
        }
        //double bit error
        if(count %2 == 0){
            cout << "\nThere is a double bit error." << endl;
            return;
        }else{//just one error
            cout << "\nThere is an error at bit position " << x << " from the left(starting at 0)." << endl;
            if(code[x] == '1'){
                code[x] = '0';
            }else{
                code[x] = '1';
            }
            cout << "Corrected code: " << code << endl;
            return;
        }
        
    }else{//if there is no message or parity bit errors
        int count = 0;
        for(int i = 0; i < code.length();i++){
            if(code[i] == '1'){
                count++;
            }
        }
        if(count %2 != 0){//if the whole codeword has a even parity error
            cout << "\nThere is an error at bit position " << x << " from the left(starting at 0)." << endl;
            if(code[x] == '1'){
                code[x] = '0';
            }else{
                code[x] = '1';
            }
            cout << "Corrected code: " << code << endl;
            return;
        }else{//no errors
            cout << "There are no error in the transimtted message." << endl;
        }
    }
    
}

int main(){
    srand (time(NULL));//set random numbers
    string userinput;
    cout << "Enter message: ";
    cin >> userinput;
    //input validation
    while(userinput.length() != 3){
        cout << "Message length is invalid...please make sure message length is exactly 3 bits\n" << endl;
        cout << "Enter message: ";
        cin >> userinput;
    }
    cout << "Hamming code distance = 5\n(n,k) = (6,3)\n" << endl;
    //ecnoded message
    cout << "****************************************************" << endl;
    cout << "Encoded Message: " << encode(userinput) << endl;
    cout << "****************************************************" << endl;
    cout <<"\n-------------Testing no error--------------"<< endl;
    string in = encode(userinput);
    decode(in);

    cout <<"\n-------------Testing 1 bit flip error--------------"<< endl;
    in = encode(userinput);
    int idx = rand()%7;
    cout << "Bit flipped for testing(starting from the left): " << idx << endl << endl;
    //flip bit
    if(in[idx] == '1'){
        in[idx] = '0';
    }else{
        in[idx] = '1';
    }
    decode(in);

    cout <<"\n-------------Testing 2 bit flip error--------------"<< endl;
    in = encode(userinput);
    idx = rand()%7;
    int idx1 = rand()%7;
    //make sure not the same index
    while(idx == idx1){
        idx1 = rand()%7;
    }
    cout << "Bits flipped for testing(starting from the left): " << idx << " and " << idx1 <<  endl << endl;
    //flip bits
    if(in[idx] == '1'){
        in[idx] = '0';
    }else{
        in[idx] = '1';
    }
    if(in[idx1] == '1'){
        in[idx1] = '0';
    }else{
        in[idx1] = '1';
    }
    decode(in);
    cout << endl;
    return 0;
}