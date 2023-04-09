#include <linux/kernel.h>
#include <linux/syscalls.h>
#include "bst.h"

struct bst_t* bst = NULL;

SYSCALL_DEFINE0(pqueue_init){
  bst =  kmalloc(sizeof(struct bst_t));
  bst->size = 0;
  bst->root = NULL;

  return 0;
}

SYSCALL_DEFINE0(pqueue_shutdown){
  if (bst == NULL){
    return -1;
  }

  clear_bst(bst->root);
  kfree(bst);
}

SYSCALL_DEFINE1(pqueue_create,unsigned long,priority){
  if (bst == NULL){
    return -1;
  }

  return insert_priority(bst,priority);
}

SYSCALL_DEFINE1(pqueue_destroy, unsigned long,priority){
  if (bst == NULL){
    return -1;
  }

  return remove_priority(bst,priority);
}

SYSCALL_DEFINE1(pqueue_count,unsigned long,priority){
  if (bst == NULL){
    return -1;
  }

  return print_count(bst,priority);
}

SYSCALL_DEFINE2(pqueue_send, unsigned long, priority, unsigned long, pid){
  if (bst == NULL){
    return -1;
  }

  return add_pid(bst,priority,pid);
}

SYSCALL_DEFINE1(pqueue_recv, unsigned long, priority){
  if (bst == NULL){
    return -1;
  }

  return print_pid(bst,priority,pid);
}

SYSCALL_DEFINE1(pqueue_delete, unsigned long, priority){
  if (bst == NULL){
    return -1;
  }

  return dequeue_pid(bst,priority,pid);
}