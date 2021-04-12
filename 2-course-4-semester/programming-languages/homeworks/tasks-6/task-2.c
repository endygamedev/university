#include <stdio.h>


/* Напишите программу для вывода входного потока по одному слову в строке. */
int main(int argc, char **argv) {
	FILE *file;
	char c;
	
	if(argc < 1) {
		printf("ERROR: Enter a file...");
		return 1;
	}
	
	file = fopen(argv[1], "r");
	
	if(!file) {
		perror(argv[2]);
		return 2;
	}

	while((c = fgetc(file)) != EOF) {
		if(c == ' ' || c == '\t')
			printf("\n");
		else
			printf("%c", c);
	}	
	return 0;
}
