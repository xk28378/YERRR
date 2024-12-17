#include <linux/kernel.h>
#include <linux/syscalls.h>
#include <linux/errno.h>
#include "bst.h"

bst_t* bst = NULL;

SYSCALL_DEFINE0(pqueue_init){
  bst =  kmalloc(sizeof(bst_t),GFP_KERNEL);
  if (!bst){
    return -ENOMEM;
  }
  bst->size = 0;
  bst->root = NULL;

  return 0;
}

SYSCALL_DEFINE0(pqueue_shutdown){
  if (bst == NULL){
    return -ENODEV;
  }

  clear_bst(bst->root);
  kfree(bst);
  return 0;
}

SYSCALL_DEFINE1(pqueue_create,unsigned long,priority){
  if (bst == NULL){
    return -ENODEV;
  }

  return insert_priority(bst,priority);
}

SYSCALL_DEFINE1(pqueue_destroy, unsigned long,priority){
  if (bst == NULL){
    return -ENODEV;
  }

  return remove_priority(bst,priority);
}

SYSCALL_DEFINE1(pqueue_count,unsigned long,priority){
  if (bst == NULL){
    return -ENODEV;
  }

  return print_count(bst,priority);
}

SYSCALL_DEFINE2(pqueue_send, unsigned long, priority, unsigned long, PID){
  if (bst == NULL){
    return -ENODEV;
  }

  return add_pid(bst,priority,PID);
}

SYSCALL_DEFINE1(pqueue_recv, unsigned long, priority){
  if (bst == NULL){
    return -ENODEV;
  }

  return print_pid(bst,priority);
}

SYSCALL_DEFINE1(pqueue_delete, unsigned long, priority){
  if (bst == NULL){
    return -ENODEV;
  }

  return dequeue_pid(bst,priority);
}