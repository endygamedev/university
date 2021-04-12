#include <stdio.h>


/* Напишите программу для подсчёта пробелов, знаков табуляции и символов конца строки. */
void task1(FILE *file) {
	int s_counter = 0, t_counter = 0, e_counter = 0;
	char c;
	while((c = fgetc(file)) != EOF) {
		switch(c) {
			case ' ':
				s_counter++;
				break;
			case '\t':
				t_counter++;
				break;
			case '\n':
				e_counter++;
				break;
		}
	}
	printf("Spaces: %d\n"
		   "Tabs: %d\n"
		   "New lines: %d\n",
		   s_counter, t_counter, e_counter);
}


int main(int argc, char **argv) {
	FILE *file;
	if(argc < 1) {
		printf("ERROR: Enter a file...");
		return 1;
	}
	file = fopen(argv[1], "r");
	if(!file) {
		perror(argv[2]);
		return 2;
	}
	task1(file);
	return 0;
}
