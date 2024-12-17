#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>;
#include <unistd.h>;

int main(int argc, char* argv[]){
  char command[] = "cat";
  char args[] = "/dev/inspiration";

  fork();
  fork();
  fork();
  int result = execvp(command,args);
}