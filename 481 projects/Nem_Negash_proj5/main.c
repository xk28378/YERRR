#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <pthread.h>


void *_server(void *port_id){
    //message server needs to send
    char *server_message[256];
    //create server socket
    int server_socket;
    server_socket = socket(AF_INET, SOCK_STREAM, 0);

    //define server address details
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    //select port using input parameter
    if(*(int*) port_id == 1){
        server_address.sin_port = htons(51112);
        printf("P1 listening on port 51112\n");
    }else if(*(int*) port_id  == 2){
        server_address.sin_port = htons(51113);
        printf("P2 listening on port 51113\n");
    }else if(*(int*) port_id  == 3){
        server_address.sin_port = htons(51114);
        printf("P3 listening on port 51114\n");
    }else if(*(int*) port_id  == 4){
        server_address.sin_port = htons(51115);
        printf("P4 listening on port 51115\n");
    }else if(*(int*) port_id  == 5){
        server_address.sin_port = htons(51116);
        printf("P5 listening on port 51116\n");
    }
    server_address.sin_addr.s_addr = INADDR_ANY;

    bind(server_socket, (struct sockaddr*) &server_address, sizeof(server_address));
    listen(server_socket, 5);
    //message depending on port
    if(*(int*) port_id == 1){
        *server_message = "This is from p1 to p2";
    }else if(*(int*)port_id == 2){
        *server_message = "This is from p2 to p3";
    }else if(*(int*) port_id == 3){
        *server_message = "This is from p3 to p4";
    }else if(*(int*) port_id == 4){
        *server_message = "This is from p4 to p5";
    }else if(*(int*) port_id == 5){
        *server_message = "This is from p5 to p1";
    }

    //set up the receiving socket
    int client_socket;
    client_socket = accept(server_socket, NULL,NULL);
    send(client_socket, *server_message, sizeof(server_message), 0);
    //close socket
    close(server_socket);
}
void *p1_client(){
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    char server_response[100];
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(51116);
    server_address.sin_addr.s_addr = INADDR_ANY;

    //try to connect
    int connection_status = connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address));

    //check connection
    if(connection_status == -1)
    {
        printf("Not able to connect to socket... \n");
    }
    
    //try to recieve data from server
    recv(client_socket, &server_response, sizeof(server_response), 0);
    //print user input
    printf("P5 sent: %s\n", server_response);

    //close the socket
    close(client_socket);
}

void *p2_client(){
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    char server_response[100];
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(51112);
    server_address.sin_addr.s_addr = INADDR_ANY;

    //try to connect
    int connection_status = connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address));

    //check connection
    if(connection_status == -1)
    {
        printf("Not able to connect to socket... \n");
    }
    
    //try to recieve data from server
    recv(client_socket, &server_response, sizeof(server_response), 0);
    //print user input
    printf("P1 sent: %s\n", server_response);

    //close the socket
    close(client_socket);
}

void *p3_client(){
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    char server_response[100];
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(51113);
    server_address.sin_addr.s_addr = INADDR_ANY;

    //try to connect
    int connection_status = connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address));

    //check connection
    if(connection_status == -1)
    {
        printf("Not able to connect to socket... \n");
    }
    
    //try to recieve data from server
    recv(client_socket, &server_response, sizeof(server_response), 0);
    //print user input
    printf("P2 sent: %s\n", server_response);

    //close the socket
    close(client_socket);
}

void *p4_client(){
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    char server_response[100];
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(51114);
    server_address.sin_addr.s_addr = INADDR_ANY;

    //try to connect
    int connection_status = connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address));

    //check connection
    if(connection_status == -1)
    {
        printf("Not able to connect to socket... \n");
    }
    
    //try to recieve data from server
    recv(client_socket, &server_response, sizeof(server_response), 0);
    //print user input
    printf("P3 sent: %s\n", server_response);

    //close the socket
    close(client_socket);
}

void *p5_client(){
    int client_socket;
    client_socket = socket(AF_INET, SOCK_STREAM, 0);
    char server_response[100];
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(51115);
    server_address.sin_addr.s_addr = INADDR_ANY;

    //try to connect
    int connection_status = connect(client_socket, (struct sockaddr *) &server_address, sizeof(server_address));

    //check connection
    if(connection_status == -1)
    {
        printf("Not able to connect to socket... \n");
    }
    
    //try to recieve data from server
    recv(client_socket, &server_response, sizeof(server_response), 0);
    //print user input
    printf("P4 sent: %s\n", server_response);

    //close the socket
    close(client_socket);
}

int main(){

    pthread_t server_thread1;
    pthread_t server_thread2;
    pthread_t server_thread3;
    pthread_t server_thread4;
    pthread_t server_thread5;
    pthread_t thread_id_1;
    pthread_t thread_id_2;
    pthread_t thread_id_3;
    pthread_t thread_id_4;
    pthread_t thread_id_5;
    int port_id = 1;

    pthread_create(&server_thread1, NULL, &_server, &port_id);
    pthread_create(&thread_id_1, NULL, &p2_client, (void *)&thread_id_1);
    sleep(2);
    port_id = 2;
    
    pthread_create(&server_thread2, NULL, &_server, &port_id);
    pthread_create(&thread_id_2, NULL, &p3_client, (void *)&thread_id_2);
    sleep(2);
    port_id = 3;

    pthread_create(&server_thread3, NULL, &_server, &port_id);
    pthread_create(&thread_id_3, NULL, &p4_client, (void *)&thread_id_3);
    sleep(3);
    port_id = 4;

    pthread_create(&server_thread4, NULL, &_server, &port_id);
    pthread_create(&thread_id_4, NULL, &p5_client, (void *)&thread_id_4);
    sleep(3);
    port_id = 5;

    pthread_create(&server_thread5, NULL, &_server, &port_id);
    pthread_create(&thread_id_5, NULL, &p1_client, (void *)&thread_id_5);
    sleep(3);

}