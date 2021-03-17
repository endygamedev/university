#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ERR_MSG_1 "ERROR: Invalid input for menu item selection\n"
#define ERR_MSG_2 "ERROR: The list already exists\n"
#define ERR_MSG_3 "ERROR: The list does not exist\n"
#define ERR_MSG_4 "ERROR: This item is not in the menu\n"
#define ERR_MSG_5 "ERROR: You cannot delete the head of the list\n"
#define ERR_MSG_6 "ERROR: This item is not in the list\n"


typedef struct item {
	char *text;
	struct item *next;
} item;


char * input();
item * create(char *text);
int list_length(item *head);
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
			printf(ERR_MSG_1);
			continue;
		}
		switch(n) {
		case 1:
			if(head == NULL) {
				text = input();
				head = create(text);
			} else {
				printf(ERR_MSG_2);
			}
			break;
		case 2:
			if(head != NULL) {
				text = input();
				add_item(head, text);
			} else {
				printf(ERR_MSG_3);
			}
			break;
		case 3:
			if(head != NULL) {
				remove_last_item(head);
			} else {
				printf(ERR_MSG_3);
			}
			break;
		case 4:
			if(head != NULL) {
				view_items(head);
			} else {
				printf(ERR_MSG_3);
			}
			break;
		case 5:
			if(head != NULL) {
				head = delete_list(head);
			} else {
				printf(ERR_MSG_3);
			}
			break;
		case 6:
			if(head != NULL) {
				text = input();
				find_item(head, text);
			} else {
				printf(ERR_MSG_3);
			}
			break;
		case 7:
			program_exit(head, &iter);
			break;
		default:
			printf(ERR_MSG_4);
			break;
		}
	}
	return 0;
}


char * input() {
	char *text;
	while(getchar() != '\n');
	printf("Enter text for the item 'text' field: ");
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


int list_length(item *head) {
	item *i = head;
	int len = 0;
	for(; i != NULL; i = i->next)
		len++;
	return len;
}


void remove_last_item(item *head) {
	item *last, *newLast;
	int len = list_length(head);
	last = head;
	while(last->next != NULL && len > 1) {
		newLast = last;
		last = last->next;
	}
	if(len > 1) {
		free(last);
		newLast->next = NULL;
	} else {
		printf(ERR_MSG_5);
	}
}


void view_items(item *head) {
	item *i = head;
	int num = 0;
	for(; i != NULL; i = i->next) {
		printf("item: %d - text: %s\n", num, i->text);
		num++;
	}
}


item * delete_list(item *head) {
	free(head);
	item *newHead = NULL;
	return newHead;
}


void find_item(item *head, char *text) {
	item *tmp = head;
	int i = 0, found = 0;
	for(; tmp != NULL; tmp = tmp->next) {
		if(!strcmp(tmp->text, text)) {
			printf("Item with text '%s' in position %d\n", text, i);
			found = 1;
		}
		i++;
	}
	if(!found)
		printf(ERR_MSG_6);
}


void program_exit(item *head, int *iter) {
	printf("Hope you come back soon! =)\n");
	free(head);
	*iter = 0;
}
