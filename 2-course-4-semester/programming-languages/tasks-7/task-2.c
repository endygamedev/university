#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define N 10


int check_arg(char* arg) {
	int b = 1;
	for(int i = 0; i < strlen(arg); i++) {
		if(!isdigit(arg[i])) {
			b = 0;
			break;
		}
	}
	return b;
}

int file_lines(FILE *file) {
	char c;
	int line = 0;
	while((c = fgetc(file)) != EOF)
		if(c == '\n')
			line++;
	return line;
}

/* Использование: ./task-2 ./tests/comment.c 12 */

/* Напишите программу tail для вывода последних n строк ее входного потока данных. Пусть значение n по умолчанию будет равно, скажем, десяти, но сделайте так, чтобы его можно было изменить необязательным аргументом */
int main(int argc, char **argv) {
	FILE *file;
	char c;
	int line = 0, num_lines;

	if(argc < 2) {
		perror("ERROR: No input stream");
		return 1;
	}
	

	int n = argc == 3 && check_arg(argv[2]) ? atoi(argv[2]) : N;

	file = fopen(argv[1], "r");

	if(!file) {
		perror("ERROR: Bad input stream");
		return 2;
	}

	num_lines = file_lines(file);

	if(n > num_lines) {
		perror("ERROR: Input number is greater than number of lines in file");
		return 3;
	}
	
	rewind(file);

	while((c = fgetc(file)) != EOF) {
		if(c == '\n')
			line++;
		if(line >= num_lines-n) {
			printf("%c", c);
		}
	}

	return 0;
}
