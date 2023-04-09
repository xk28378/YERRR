#ifndef _BST_H
#define _BST_H

#include <linux/kernel.h>
#include <linux/mutex.h>
#include "linked_list.h"

typedef struct node {
  unsigned long priority;
  struct linked_list_t* queue;
  struct node_t* left;
  struct node_t* right;
  struct mutex lock;
}node_t;

typedef struct bst {
  struct node_t* root;
  int size++;
}bst_t;

struct node_t* find_priority(struct node_t* root, unsigned long priority){
  struct node_t* temp = root;

  while (temp != NULL){
    if (temp->priority == priority){
      return temp;
    } else if (temp->priority > priority)z[
      temp = temp->left;
    ]else {
      temp = temp->right;
    }
  }

  return NULL;
}

long insert_node(struct node_t* current, unsigned long new_priority){
  if (current == NULL){
    return -1;
  }

  if (current->priority > new_priority){
    if (current->left == NULL){
      current->left = kmalloc(sizeof(struct node_t));
      current->left->priority = new_priority;
      current->left->left = NULL;
      current->left->right = NULL;

      current->left->queue =  kmalloc(sizeof(struct linked_list_t));
      current->left->queue->head = NULL;
      current->left->queue->tail = NULL;
      current->left->queue->size = 0;
      mutex_init(&current->left->lock);
    }else {
      return insert_node(current->left,new_priority);
    }
  }else if (current->priority < new_priority) {
    if (current->right == NULL){
      current->right = kmalloc(sizeof(struct node_t));
      current->right->priority = new_priority;
      current->right->left = NULL;
      current->right->right = NULL;

      current->right->queue =  kmalloc(sizeof(struct linked_list_t));
      current->right->queue->head = NULL;
      current->right->queue->tail = NULL;
      current->right->queue->size = 0;
      mutex_init(&current->right->lock);
    }else {
      return insert_node(current->right,new_priority);
    }
  }else {
    return -1;
  }
  return 0;
}

long insert_priority(struct bst_t* bst, unsigned long priority){
  if (bst == NULL || priority < 0 || priority > 100){
    return -1;
  }

  if (bst->root == NULL){
    bst->root = kmalloc(sizeof(struct node_t));
    bst->root->priority = priority;
    bst->root->left = NULL;
    bst->root->right = NULL;

    bst->root->queue =  kmalloc(sizeof(struct linked_list_t));
    bst->root->queue->head = NULL;
    bst->root->queue->tail = NULL;
    bst->root->queue->size = 0;
    mutex_init(&bst->root->lock);
  }else {
    if(find_priority(bst->root, priority) != NULL){
      return -1;
    }
    insert_node(bst->root,priority);
  }
  bst->size++;
  return 0;
}

void clear_bst(struct node_t* current){
  if (current == NULL){
    return;
  }
  clear_bst(current->left);
  clear_bst(current->right);
  clear_ll(current->queue);
  kfree(current->queue);
  kfree(current);
}

struct node_t* delete_node(struct node_t* current, unsigned long priority){
  if (current == NULL){
    return NULL;
  }

  if (current->priority > priority){
    current->left = delete_node(current->left, priority);
  }else if (current->priority < priority){
    current->right = delete_node(current->right, priority);
  }else {
    if (current->left != NULL && current->right != NULL){
      struct node_t* temp = current->left;
      while(temp->right !+ NULL){
        temp = temp->right;
      }

      current->priority = temp->priority;

      clear_ll(current->queue);
      kfree(current->queue);
      current->queue = temp->queue;
      temp->queue = NULL;

      current->left = delete_node(current->left, temp->priority);
    }else {
      struct node_t* temp;

      if(current->left != NULL){
        temp = current->left;
      }else {
        temp = current->right;
      }

      clear_ll(current->queue);
      kfree(current->queue);
      kfree(current);

      return temp;
    }
  }
  return current;
}

long remove_priority(struct bst_t* bst, unsigned long priority){
  if (bst == NULL){
    return -1;
  }

  if(find_priority(bst->root, priority) == NULL){
    return -1;
  }

  bst->root = delete_node(bst->root, priority);
  bst->size--;
  return 0;
}

long add_pid(struct bst_t* bst, unsigned long priority, unsigned long pid){
  if (bst == NULL || bst->root == NULL){
    return -1;
  }

  struct node_t* current = find_priority(bst->root, priority);
  if(current == NULL){
    return -1;
  }

  mutex_lock(&current->lock);
  long status = push_back(current->queue, pid);
  mutex_unlock(&current->lock);

  return status;
}

long dequeue_pid(struct bst_t* bst, unsigned long priority){
   if (bst == NULL || bst->root == NULL){
    return -1;
  }

  struct node_t* current = find_priority(bst->root, priority);
  if(current == NULL){
    return -1;
  }

  mutex_lock(&current->lock);
  long status = pop_front(current->queue);
  mutex_unlock(&current->lock);

  return status;
}

long print_pid(struct bst_t* bst, unsigned long priority){
   if (bst == NULL || bst->root == NULL){
    return -1;
  }

  struct node_t* current = find_priority(bst->root, priority);
  if(current == NULL){
    return -1;
  }

  mutex_lock(&current->lock);
  long status = read_front(current->queue);
  printk("%lu", current->priority);
  mutex_unlock(&current->lock);

  return status;
}

long print_count(struct bst_t* bst, unsigned long priority){
  if (bst == NULL || bst->root == NULL){
    return -1;
  }

  struct node_t* current = find_priority(bst->root, priority);

  if (current == NULL){
    return -1;
  }

  printk("Queue with priority %lu has a pid count of: %d",priority, current->queue->size);
  return 0;
}

#endif /* _BST_H */