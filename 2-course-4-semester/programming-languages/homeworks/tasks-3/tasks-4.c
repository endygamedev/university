#include <stdio.h>


void print_row(int line, FILE *file)
{
	int i = 0, c;
	while(i < line) {
		c = fgetc(file);
		if(c == '\n')
			i++;
	}
	while((c = fgetc(file)) != '\n' && c != EOF)
		printf("%c", c);
	printf("\n");
}


int main(int argc, char **argv)
{
	FILE *first, *second;
	FILE *first_c, *second_c;
	int c1, c2, line = 0;
	if(argc < 3) {
		fprintf(stderr, "Error: too few arguments\n");
		return 1;
	}
	first = fopen(argv[1], "r");
	first_c = fopen(argv[1], "r");
	if(!first) {
		perror(argv[1]);
		return 2;
	}
	second = fopen(argv[2], "r");
	second_c = fopen(argv[2], "r");
	if(!second) {
		perror(argv[2]);
		return 3;
	}
	while((c1 = fgetc(first)) == (c2 = fgetc(second)) && c1 != EOF && c2 != EOF) {
		if(c1 == '\n')
			line++;
	}
	if(c1 == EOF && c2 == EOF) {
		printf("Files are the same\n");
	} else {
		printf("File differ on line %d\n", line + 1);
		print_row(line, first_c);
		print_row(line, second_c);
	}
	return 0;
}
