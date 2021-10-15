#include <stdio.h>
#include <stdlib.h>

struct node {
	int value;
	struct node *left;
    struct node *right;
};

struct node* newNode(int toAdd)
{
	struct node* temp = (struct node*)malloc(sizeof(struct node));
	temp->value = toAdd;
	temp->left = NULL;
    temp->right = NULL;
	return temp;
}

void inorder(struct node* root)
{
	if (root != NULL) {
		inorder(root->left);
		printf("%d\t", root->value);
		inorder(root->right);
	}
}

struct node* insert(struct node* node, int value)
{
	if (node == NULL)
    {
        return newNode(value);
    }
	if (value < node->value)
		node->left = insert(node->left, value);
	else
		node->right = insert(node->right, value);
	return node;
}

struct node* minValueNode(struct node* node)
{
	struct node* current = node;
	while (current && current->left != NULL)
		current = current->left;
	return current;
}

struct node* delete(struct node* root, int value)
{
	if (root == NULL)
		return root;

	if (value < root->value)
		root->left = delete(root->left, value);

	else if (value > root->value)
		root->right = delete(root->right, value);

	else {
		if (root->left == NULL) {
			struct node* temp = root->right;
			free(root);
			return temp;
		}
		else if (root->right == NULL) {
			struct node* temp = root->left;
			free(root);
			return temp;
		}

		struct node* temp = minValueNode(root->right);

		root->value = temp->value;

		root->right = delete(root->right, temp->value);
	}
	return root;
}

int main()
{
	struct node* root = NULL;
    int choice = 0;
    int nodeval = 0;
    printf("Binary Search Tree - All Operations\n");

    while (choice < 4) {

        printf("\nchoices\n");
        printf("1 : Insert a New Node \n");
        printf("2 : Delete an existing Node \n");
        printf("3 : Print Tree in Inorder Traversal Fashion for Visualization Purposes \n");
        printf("Enter any Other Number to End the Process\n");
        printf("Enter your choice:");
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
            inorder(root);
            break;
        default:
            break;
        }
    }
    return 0;
}
