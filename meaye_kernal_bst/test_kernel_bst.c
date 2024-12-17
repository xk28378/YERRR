#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <linux/kernel.h>
#include <sys/syscall.h>

#define __NR_pqueue_init 449
#define __NR_pqueue_shutdown 450
#define __NR_pqueue_create 451
#define __NR_pqueue_destroy 452
#define __NR_pqueue_count 453
#define __NR_pqueue_send 454
#define __NR_pqueue_recv 455
#define __NR_pqueue_delete 456

long pqueue_init_syscall(void){
  return syscall(__NR_pqueue_init);
}

long pqueue_shutdown_syscall(void){
  return syscall(__NR_pqueue_shutdown);
}

long pqueue_create_syscall(unsigned long priority){
  return syscall(__NR_pqueue_create, priority);
}

long pqueue_destroy_syscall(unsigned long priority){
  return syscall(__NR_pqueue_destroy, priority);
}

long pqueue_count_syscall(unsigned long priority){
  return syscall(__NR_pqueue_count, priority);
}

long pqueue_send_syscall(unsigned long priority, unsigned long PID){
  return syscall(__NR_pqueue_send, priority, PID);
}

long pqueue_recv_syscall(unsigned long priority){
  return syscall(__NR_pqueue_recv, priority);
}

long pqueue_delete_syscall(unsigned long priority){
  return syscall(__NR_pqueue_delete, priority);
}

int main(int argc, char* argv[]){
  long result = pqueue_init_syscall();
  long result2 = pqueue_create_syscall(1);
  long result3 = pqueue_create_syscall(2);
  long result4 = pqueue_send_syscall(1,4);
  long result5 = pqueue_send_syscall(1,5);
  long result6 = pqueue_send_syscall(1,6);
  long result7 = pqueue_send_syscall(2,1);
  long result8 = pqueue_count_syscall(1);
  long result9 = pqueue_count_syscall(2);
  long result10 = pqueue_recv_syscall(1);
  long result11 = pqueue_delete_syscall(1);
  long result12 = pqueue_recv_syscall(1);
  long result13 = pqueue_delete_syscall(1);
  long result14 = pqueue_destroy_syscall(1);
  long result15 = pqueue_shutdown_syscall();
  printf("%lu %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu", result,result2,result3,result4,result5,result6,result7,result8,result9,result10,result11,result12,result13,result14,result15);
  return 0;
}
