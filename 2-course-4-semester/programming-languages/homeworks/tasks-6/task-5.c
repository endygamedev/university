#include <stdio.h>
#include <string.h>


int string_len(char *s) {
	int len = 0;
	char c;
	while((c = *(s++)) != '\0')
		len++;
	return len;
}


void reverse(char *s) {
	char *start = s, *end = s, tmp;
	int len = string_len(s);

	for(int i = 0; i < len - 1; i++)
		end++;

	for(int i = 0; i < len/2; i++) {
		tmp = *end;
		*end = *start;
		*start = tmp;
		start++;
		end--;
	}
}


/* Напишите функцию `reverse(s)`, которая переписывает свой строковый аргумент `s` в обратном порядке. Воспользуйтесь ей для написания программы, которая бы выполняла такое обращение над каждой строкой входного потока по очереди. */
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
	char *line;
	
	while((c = fgetc(file)) != EOF) {
		if(c != '\n') {
			strncat(line, &c, 1);
		} else {
			reverse(line);
			printf("%s\n", line);
			strcpy(line, "");
		}
	}

	return 0;
}
