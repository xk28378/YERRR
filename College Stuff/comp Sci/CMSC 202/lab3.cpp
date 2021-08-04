#include <iostream>
using namespace std;
int divThree(int[], int);

int main(){
   const int MAXSIZE = 100;
   int myArray[MAXSIZE] = {0};
   int currSize = 0;
   int inputValue = 1;
   int numValues;
   while(inputValue != 0){
     cout << "Enter a number (0 when done): ";
     cin >> inputValue;
     if(inputValue != 0){
       myArray[currSize] = inputValue;
       currSize++ ;
       cout << endl;
     }
   }
   cout << "Original Array:";
   for(int i = 0; i < currSize; i++){
     cout << myArray[i] << " ";
   }
   cout << endl;
   numValues = divThree(myArray ,currSize);
   cout << "The array contains "<< numValues << " numbers divisible by 3" << endl;
   cout << "Modified Array: ";
   for(int i = 0; i < currSize; i++){
     cout << myArray[i] << " ";
   }
   cout << endl;
   //Code to take in values and print results goes here
   
  return 0;
}

//implement divThree here
int divThree(int Array[], int currSize){
  int num = 0;
  for(int i = 0; i < currSize; i++){
    if(Array[i] % 3 == 0){
      num++;
      Array[i] /= 3;
    }

  }
  return num;
}
