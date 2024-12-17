#ifndef _LINKED_LIST_H
#define _LINKED_LIST_H

#include <linux/kernel.h>

typedef struct list_node {
  unsigned long pid;
  struct list_node* next;
} list_node_t;

typedef struct linked_list {
  list_node_t* head;
  list_node_t* tail;
  int size;
}linked_list_t;

long push_back(linked_list_t* list, int new_pid){
  if (list == NULL){
    return -1;
  }

  list_node_t* new_node = kmalloc(sizeof(list_node_t),GFP_KERNEL);
  new_node->pid = new_pid;
  new_node->next = NULL;

  if(list->head == NULL){
    list->head = new_node;
    list->tail = new_node;
  }else {
    list->tail->next = new_node;
    list->tail = new_node;
  }

  list->size += 1;
  return 0;
}

long read_front(linked_list_t* list){
  if(list == NULL || list->head == NULL){
    return -1;
  }
  printk("Pid: %lu at priority ",list->head->pid);
  return 0;
}

long pop_front(linked_list_t* list){
  if(list == NULL || list->head == NULL){
    return -1;
  }

  read_front(list);

  list_node_t* new_head = list->head->next;
  kfree(list->head);

  list->head = new_head;
  list->size -= 1;

  return 0;
}

void delete_list(list_node_t*node){
  if (node->next != NULL){
    delete_list(node->next);
  }

  kfree(node);
}

long clear_ll(linked_list_t* list){
  if (list == NULL || list->head == NULL){
    return -1;
  }

  delete_list(list->head);
  return 0;
}

void print_node(list_node_t* node){
  if (node == NULL){
    printk("NULL\n");
  }
  printk("%lu -> ", node->pid);
  print_node(node->next);
}

void display_ll(linked_list_t* list){
  if (list == NULL){
    return;
  }
  print_node(list->head);
}

#endif /* _LINKED_LIST_H */