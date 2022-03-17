#include <stdio.h>


int is_special_char(char c, char *special_chars) {
	int special_check = 0;
	for(int s = 0; special_chars[s] != '\0'; s++) {
		if(c == special_chars[s]) {
			special_check = 1;
			break;
		}
	}
	return special_check;
}


/* Напишите программу для вывода гистограммы длин слов во входном потоке */
int main(int argc, char **argv) {
	FILE *file;
	char c, *special_chars = ".,?&!%~-+()$#@/\t\n "; /* Можно расширить список специальных симоволов */
	
	if(argc < 1) {
		printf("ERROR: Enter a file...");
		return 1;
	}
	
	file = fopen(argv[1], "r");
	
	if(!file) {
		perror(argv[2]);
		return 2;
	}


	int len  = 0, special_check = 0;
	while((c = fgetc(file)) != EOF)
		len++;

	int arr[len], word_len = 0;

	for(int i = 0; i < len; i++)
		arr[i] = 0;

	rewind(file);

	while((c = fgetc(file)) != EOF) {
		if((special_check = is_special_char(c, special_chars))) {
			if(word_len)
				arr[word_len]++;
			word_len = 0;
			special_check = 0;
		} else {
			word_len++;
		}
	}

	for(int i = 0; i < len; i++)
		if(arr[i])
			printf("Words with %d chars - %d\n", i, arr[i]);
	return 0;
}
