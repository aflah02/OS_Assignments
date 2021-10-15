#include <stdio.h>
#include <stdlib.h>

struct Node {
  int data;
  struct Node *left;
  struct Node *right;
  int height;
};

int max(int a, int b);

int height(struct Node *N) {
  if (N != NULL)
    return N->height;
  return 0;
}

int max(int a, int b) {
  if (a > b){
    return a;
  }
  return b;
}

struct Node *newNode(int val) {
  struct Node *node = (struct Node *)malloc(sizeof(struct Node));
  node->data = val;
  node->left = NULL;
  node->right = NULL;
  node->height = 1;
  return (node);
}

struct Node *RR(struct Node *y) {
  struct Node *x = y->left;
  struct Node *T2 = x->right;

  x->right = y;
  y->left = T2;

  y->height = max(height(y->left), height(y->right)) + 1;
  x->height = max(height(x->left), height(x->right)) + 1;

  return x;
}

struct Node *LR(struct Node *x) {
  struct Node *y = x->right;
  struct Node *T2 = y->left;

  y->left = x;
  x->right = T2;

  x->height = max(height(x->left), height(x->right)) + 1;
  y->height = max(height(y->left), height(y->right)) + 1;

  return y;
}

int getBalance(struct Node *N) {
  if (N != NULL){
    return height(N->left) - height(N->right);
  }
  else {
    return 0;
  }  
}

struct Node *insert(struct Node *node, int data) {
  if (node == NULL) return (newNode(data));
  if (data < node->data) node->left = insert(node->left, data);
  else if (data > node->data) node->right = insert(node->right, data);
  else return node;
  node->height = 1 + max(height(node->left), height(node->right));
  int balance = getBalance(node);
  if (balance > 1 && data < node->left->data) return RR(node);
  if (balance < -1 && data > node->right->data) return LR(node);

  if (balance > 1 && data > node->left->data) {
    node->left = LR(node->left);
    return RR(node);
  }

  if (balance < -1 && data < node->right->data) {
    node->right = RR(node->right);
    return LR(node);
  }
  return node;
}

struct Node *SmallestNode(struct Node *node) {
  struct Node *tracker = node;
  while (tracker->left != NULL) tracker = tracker->left;
  return tracker;
}

struct Node *delete(struct Node *root, int data) {
  if (root == NULL) return root;
  if (data < root->data) root->left = delete(root->left, data);
  else if (data > root->data) root->right = delete(root->right, data);
  else {
    if ((root->left == NULL) || (root->right == NULL)) {
      // struct Node *temp = NULL;
      // if (root->left != NULL){
      //   struct Node *temp = root->left;
      // }
      // else{
      //   struct Node *temp = root->right;
      // }
      struct Node *temp = root->left ? root->left : root->right;
      if (temp == NULL) {
        temp = root;
        root = NULL;
      } else
        *root = *temp;
      free(temp);
    } else {
      struct Node *temp = SmallestNode(root->right);
      root->data = temp->data;
      root->right = delete(root->right, temp->data);
    }
  }

  if (root == NULL) return root;

  root->height = 1 + max(height(root->left), height(root->right));

  int balance = getBalance(root);
  if (balance > 1 && getBalance(root->left) >= 0) return RR(root);
  if (balance > 1 && getBalance(root->left) < 0) {
    root->left = LR(root->left);
    return RR(root);
  }
  if (balance < -1 && getBalance(root->right) <= 0) return LR(root);
  if (balance < -1 && getBalance(root->right) > 0) {
    root->right = RR(root->right);
    return LR(root);
  }

  return root;
}

void PreOrderFashionVisualizer(struct Node *root) {
  if (root != NULL) {
    printf("%d ", root->data);
    PreOrderFashionVisualizer(root->left);
    PreOrderFashionVisualizer(root->right);
  }
}

int main() {
  struct Node *root = NULL;

    int choice = 0;
    int nodeval = 0;
    printf("Balanced Binary Search Tree - All Operations\n");

    while (choice < 4) {

        printf("\nchoices\n");
        printf("1 : Insert a New Node \n");
        printf("2 : Delete an existing Node \n");
        printf("3 : Print Tree in PreOrder Traversal Fashion for Visualization Purposes \n");
        printf("Enter any Other Number to End the Process\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch (choice) {
        case 1:
            printf("\nEnter Value to be Added\n");
            scanf("%d", &nodeval);
            root = insert(root, nodeval);
            break;
        case 2:
            printf("\nEnter Value to be Deleted (incase value is not present in tree nothing will happen)\n");
            scanf("%d", &nodeval);
            root = delete(root, nodeval);
            break;
        case 3:
            PreOrderFashionVisualizer(root);
            break;
        default:
            break;
        }
    }
    return 0;
}