#include <stdio.h>


int main(int argc, char **argv)
{
	FILE *first, *second;
	int c1, c2;
	if(argc < 3) {
		fprintf(stderr, "Error: too few arguments\n");
		return 1;
	}
	first = fopen(argv[1], "r");
	if(!first) {
		perror(argv[1]);
		return 2;
	}
	second = fopen(argv[2], "r");
	if(!second) {
		perror(argv[2]);
		return 3;
	}
	while((c1 = fgetc(first)) == (c2 = fgetc(second)));
	printf("%s:\n", argv[1]);
	while(c1 != '\n' && c1 != EOF) {
		printf("%c", c1);
		c1 = fgetc(first);
	}
	printf("\n%s:\n", argv[2]);
	while(c2 != '\n' && c2 != EOF) {
		printf("%c", c2);
		c2 = fgetc(second);
	}
	printf("\n");
	return 0;
}
