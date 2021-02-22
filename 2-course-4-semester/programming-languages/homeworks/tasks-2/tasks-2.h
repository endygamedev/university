#ifndef _STDIO_H
#include <stdio.h>
#include <limits.h>
#include <math.h>
#endif


#ifdef _STDIO_H
/* Напишите программу, которая суммирует последовательность целых чисел. Первое целое число, считываемое с помощью scanf, определяет количество значений, которое осталось ввести. Программа должна считывать только одно значение при каждом выполнении scanf. Например, 5 100 200 300 400 500 где 5 указывает, что должны суммироваться последующие 5 значений. */
void task1()
{
	int n, in, i = 0, sum = 0;
	if(scanf("%d", &n) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	while(i++ < n) {
		if(scanf("%d", &in) != 1) {
			printf("Error: wrong input\n");
			return;
		}
		sum += in;
	}
	printf("Sum of numbers is %d", sum);
}


/* Напишите программу, которая находит наименьшее из нескольких целых чисел. Первое считанное значение определяет количество оставшихся значений. */
void task2()
{
	int n, in, i = 0, min = INT_MAX;
	if(scanf("%d", &n) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	while(i++ < n) {
		if(scanf("%d", &in) != 1) {
			printf("Error: wrong input\n");
			return;
		}
		if(in < min)
			min = in;
	}
	printf("Minimum number in sequence is %d", min);
}


/* Проверить, содержится ли цифра 5 в целом числе. */
void task3()
{
	int num, check = 0;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	while((num /= 10) != 0) {
		if(num % 10 == 5) {
			check = 1;
			break;
		}
	}
	printf("Number%s contains five", check ? "" : " doesn't");
}


/* Найти количество четных цифр в целом числе. */
void task4()
{
	int num, counter;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	while((num /= 10) != 0) {
		if((num % 10) % 2 == 0)
			counter++;
	}
	printf("Number contains %d even digits", counter);
}


/* Проверить, совпадает ли первая цифра с последней в целовм числе. */
void  task5()
{
	int num, last, first;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	last = num % 10;
	first = num;
	while((first /= 10) >= 10);
	printf("The last digit is %s the first", first == last ? "the same as" : "different from");
}


/* Проверить, является ли целое число симметричным в двоичной записи. */
void task6()
{
	return;
}


/* Проверить, состоит ли целое число из двух одинаковых половинок. */
int int_length(int num)
{
	int len = 0;
	do {
		len++;
	} while((num /= 10) != 0);
	return len;
}

 
void task7()
{
	int num, len, check = 1;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	len = int_length(num);
	int digits[len];
	for(int i = 0; i < len; i++) {
		digits[i] = num % 10;
		num /= 10;
	}
	for(int i = 0, j = len-1; i < len/2 && j > len/2; i++, j--) {
		if(digits[i] != digits[j]) {
			check = 0;
			break;
		}
	}
	printf("Number%s consists of two identical halves", check ? "" : " doesn't");
}


/* Проверить, чередуются ли чётные цифры с нечётными в целом числе. */
void task8()
{
	int num, len, check = 1;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	len = int_length(num);
	int digits[len];
	for(int i = 0; i < len; i++) {
		digits[i] = num % 10;
		num /= 10;
	}
	if(len == 1) {
		printf("Number alternates between even and odd digits");
		return;
	}
	for(int i = 0, j = 1; i < len && j < len; i++, j++) {
		if(digits[i] % 2 != 0 && digits[j % len] % 2 != 0 || digits[i] % 2 == 0 && digits[j % len] % 2 == 0) {
			check = 0;
			break;
		}
	}
	printf("Number%s alternates between even and odd digits", check ? "" : " doesn't");
}


/* Удалить из целого числа все нечётные цифры. */
void task9()
{
	int num, len, res = 0, even = 0;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	len = int_length(num);
	int digits[len];
	for(int i = 0; i < len; i++) {
		if((num % 10) % 2 == 0)
			digits[i] = num % 10;
		else
			digits[i] = 0;
		num /= 10;
	}
	for(int i = 0; i < len; i++) {
		if(digits[i] != 0) {
			res += digits[i] * pow(10, even);
			even++;
		}
	}
	printf("%d", res);
}

/* Продублировать все нечётные цифры в целом числе. */
void task10()
{
	int num, len, res = 0, odd = 0;
	if(scanf("%d", &num) != 1) {
		printf("Error: wrong input\n");
		return;
	}
	len = int_length(num);
	int digits[len];
	for(int i = 0; i < len; i++) {
		digits[i] = num % 10;
		num /= 10;
	}
	for(int i = 0; i < len; i++) {
		res += digits[i] * pow(10, i);
		if(digits[i] % 2 != 0)
			res += digits[i] * pow(10, i+1);
	}
	printf("%d", res);
}


#endif
