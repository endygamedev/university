#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct item {
	char *text;
	struct item *next;
} item;

char * input();
item * create(char *text);
void add_item(item *head, char *text);
void remove_last_item(item *head);
void view_items(item *head); 
item * delete_list(item *head);
void find_item(item *head, char *text);
void program_exit(item *head, int *iter);


int main()
{
	printf("Program menu:\n"
		   "(1) Create the first element of a linked list\n"
		   "(2) Add an item to the end of a linked list\n"
		   "(3) Remove an element from the end of a linked list\n"
		   "(4) View linked list\n"
		   "(5) Delete entire linked list\n"
		   "(6) Perform a sequential search for a specified item in a linked list\n"
		   "(7) Exit the program\n");
	int iter = 1;
	item *head = NULL;
	char *text;
	while(iter) {
		int n;
		printf("Select menu item number: ");
		if(scanf("%d", &n) != 1) {
			while(getchar() != '\n');
			printf("Invalid input...\n");
			continue;
		}
		switch(n) {
		case 1:
			text = input();
			head = create(text);
			break;
		case 2:
			text = input();
			add_item(head, text);
			break;
		case 3:
			remove_last_item(head);
			break;
		case 4:
			view_items(head);
			break;
		case 5:
			head = delete_list(head);
			break;
		case 6:
			text = input();
			find_item(head, text);
			break;
		case 7:
			program_exit(head, &iter);
			break;
		default:
			printf("This item is not in the menu...\n");
			break;
		}
	}
	return 0;
}

char * input() {
	char *text;
	while(getchar() != '\n');
	scanf("%ms", &text);
	return text;
}

item * create(char *text) {
	item *i = malloc(sizeof(item));
	i->text = text;
	i->next = NULL;
	return i;
}


void add_item(item *head, char *text) {
	item *tmp, *newNode;
	tmp = head;
	newNode = create(text);
	while(tmp->next != NULL)
		tmp = tmp->next;
	tmp->next = newNode;
}


void remove_last_item(item *head) {
	item *last, *newLast;
	last = head;
	while(last->next != NULL) {
		newLast = last;
		last = last->next;
	}
	free(last);
	newLast->next = NULL;
}


void view_items(item *head) {
	item *i = head;
	for(; i != NULL; i = i->next)
		printf("text: %s\n", i->text);
}


item * delete_list(item *head) {
	free(head);
	item *newHead = NULL;
	return newHead;
}


void find_item(item *head, char *text) {
	item *tmp = head;
	int i = 1;
	while(strcmp(tmp->text, text) && tmp->next != NULL) {
		tmp = tmp->next;
		i++;
	}
	printf("Item with text '%s' in position %d\n", text, i);
}


void program_exit(item *head, int *iter) {
	printf("Hope you come back soon! =)\n");
	free(head);
	*iter = 0;
}
