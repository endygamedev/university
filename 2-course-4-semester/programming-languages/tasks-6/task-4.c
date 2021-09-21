#include <stdio.h>
#include <string.h>


/* Напишите программу для вывода всех строк входного потока, имеющих длину более 80 символов. */
int main(int argc, char **argv) {
	FILE *file;
	char c, *line;

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
		if(c != '\n') {
			strncat(line, &c, 1);
		} else {
			if(strlen(line) > 80)
				printf("%s\n\n", line);
			strcpy(line, "");
		}
	}

	return 0;
}
