#ifndef _BST_H
#define _BST_H

#include <linux/kernel.h>
#include <linux/mutex.h>
#include <linux/errno.h>
#include "linked_list.h"

typedef struct bst_node {
  unsigned long priority;
  linked_list_t* queue;
  struct bst_node* left;
  struct bst_node* right;
  struct mutex lock;
}bst_node_t;

typedef struct bst {
  bst_node_t* root;
  int size;
}bst_t;

bst_node_t* find_priority(bst_node_t* root, unsigned long priority){
  bst_node_t* temp = root;

  while (temp != NULL){
    if (temp->priority == priority){
      return temp;
    } else if (temp->priority > priority){
      temp = temp->left;
    }else {
      temp = temp->right;
    }
  }

  return NULL;
}

long insert_bst_node(bst_node_t* curr, unsigned long new_priority){
  if (curr == NULL){
    return -ENOENT;
  }

  if (curr->priority > new_priority){
    if (curr->left == NULL){
      curr->left = kmalloc(sizeof(bst_node_t),GFP_KERNEL);
      curr->left->priority = new_priority;
      curr->left->left = NULL;
      curr->left->right = NULL;

      curr->left->queue =  kmalloc(sizeof(linked_list_t),GFP_KERNEL);
      curr->left->queue->head = NULL;
      curr->left->queue->tail = NULL;
      curr->left->queue->size = 0;
      mutex_init(&curr->left->lock);
    }else {
      return insert_bst_node(curr->left,new_priority);
    }
  }else if (curr->priority < new_priority) {
    if (curr->right == NULL){
      curr->right = kmalloc(sizeof(bst_node_t),GFP_KERNEL);
      curr->right->priority = new_priority;
      curr->right->left = NULL;
      curr->right->right = NULL;

      curr->right->queue =  kmalloc(sizeof(linked_list_t),GFP_KERNEL);
      curr->right->queue->head = NULL;
      curr->right->queue->tail = NULL;
      curr->right->queue->size = 0;
      mutex_init(&curr->right->lock);
    }else {
      return insert_bst_node(curr->right,new_priority);
    }
  }else {
    return -EEXIST;
  }
  return 0;
}

long insert_priority(bst_t* bst, unsigned long priority){
  if (bst == NULL || priority < 0 || priority > 100){
    return -EINVAL;
  }
  
  long status;
  if (bst->root == NULL){
    bst->root = kmalloc(sizeof(bst_node_t),GFP_KERNEL);
    bst->root->priority = priority;
    bst->root->left = NULL;
    bst->root->right = NULL;

    bst->root->queue =  kmalloc(sizeof(linked_list_t),GFP_KERNEL);
    bst->root->queue->head = NULL;
    bst->root->queue->tail = NULL;
    bst->root->queue->size = 0;
    mutex_init(&bst->root->lock);
    status = 0;
  }else {
    if(find_priority(bst->root, priority) != NULL){
      return -EEXIST;
    }
    status = insert_bst_node(bst->root,priority);
    
  }
  bst->size += 1;
  return status;
}

void clear_bst(bst_node_t* curr){
  if (curr == NULL){
    return;
  }
  clear_bst(curr->left);
  clear_bst(curr->right);
  clear_ll(curr->queue);
  kfree(curr->queue);
  kfree(curr);
}

bst_node_t* delete_bst_node(bst_node_t* curr, unsigned long priority){
  if (curr == NULL){
    return NULL;
  }

  if (curr->priority > priority){
    curr->left = delete_bst_node(curr->left, priority);
  }else if (curr->priority < priority){
    curr->right = delete_bst_node(curr->right, priority);
  }else {
    if (curr->left != NULL && curr->right != NULL){
      bst_node_t* temp = curr->left;
      while(temp->right != NULL){
        temp = temp->right;
      }

      curr->priority = temp->priority;

      clear_ll(curr->queue);
      kfree(curr->queue);
      curr->queue = temp->queue;
      temp->queue = NULL;

      curr->left = delete_bst_node(curr->left, temp->priority);
    }else {
      bst_node_t* temp;

      if(curr->left != NULL){
        temp = curr->left;
      }else {
        temp = curr->right;
      }

      clear_ll(curr->queue);
      kfree(curr->queue);
      kfree(curr);

      return temp;
    }
  }
  return curr;
}

long remove_priority(bst_t* bst, unsigned long priority){
  if (bst == NULL){
    return -EINVAL;
  }

  if(find_priority(bst->root, priority) == NULL){
    return -ENOENT;
  }

  bst->root = delete_bst_node(bst->root, priority);
  bst->size -= 1;
  return 0;
}

long add_pid(bst_t* bst, unsigned long priority, unsigned long pid){
  if (bst == NULL || bst->root == NULL){
    return -EINVAL;
  }

  bst_node_t* curr = find_priority(bst->root, priority);
  if(curr == NULL){
    return -ENOENT;
  }

  mutex_lock(&curr->lock);
  long status = push_back(curr->queue, pid);
  mutex_unlock(&curr->lock);

  return status;
}

long dequeue_pid(bst_t* bst, unsigned long priority){
   if (bst == NULL || bst->root == NULL){
    return -EINVAL;
  }

  bst_node_t* curr = find_priority(bst->root, priority);
  if(curr == NULL){
    return -ENOENT;
  }

  mutex_lock(&curr->lock);
  long status = pop_front(curr->queue);
  mutex_unlock(&curr->lock);

  return status;
}

long print_pid(bst_t* bst, unsigned long priority){
   if (bst == NULL || bst->root == NULL){
    return -EINVAL;
  }

  bst_node_t* curr = find_priority(bst->root, priority);
  if(curr == NULL){
    return -ENOENT;
  }

  mutex_lock(&curr->lock);
  long status = read_front(curr->queue);
  printk("%lu", curr->priority);
  mutex_unlock(&curr->lock);

  return status;
}

long print_count(bst_t* bst, unsigned long priority){
  if (bst == NULL || bst->root == NULL){
    return -EINVAL;
  }

  bst_node_t* curr = find_priority(bst->root, priority);

  if (curr == NULL){
    return -ENOENT;
  }

  printk("Queue with priority %lu has a pid count of: %d",priority, curr->queue->size);
  return 0;
}

#endif /* _BST_H */