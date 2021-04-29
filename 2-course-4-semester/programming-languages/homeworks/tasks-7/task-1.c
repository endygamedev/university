#include <stdio.h>


/* Напишите программу для удаления всех комментариев из программы на C. Позаботьтесь о корректной обработке символьных костант и строк в двойных кавычках. Вложенные комментарии в C не допускаются. */
int main(int argc, char **argv) {
	FILE *file, *new_file;
	char c, next_c;
	
	if(argc < 3) {
		perror("ERROR: Not enough files");
		return 1;
	}

	file = fopen(argv[1], "r");
	new_file = fopen(argv[2], "w");
	
	if(!file) {
		perror("ERROR: Bad read file");
		return 2;
	}

	if(!new_file) {
		perror("ERROR: Bad write file");
		return 3;
	}

	next_c = fgetc(file);
	while(next_c != EOF) {
		c = next_c;
		next_c = fgetc(file);
		if(c == '/' && next_c == '*') {
			next_c = fgetc(file);
			while(!(c == '*' && next_c == '/')) {
				c = next_c;
				next_c = fgetc(file);
			}
			c = fgetc(file);
			next_c = fgetc(file);
		}
		fputc(c, new_file);
	}
	fclose(file);
	fclose(new_file);
	return 0;
}
