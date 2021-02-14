#include <stdio.h>


/* Дано целое число `n` > 0. */
/* Найти наименьшее целое положительное число `k`, квадрат которого превосходит `n`: `k^2 > n`. */
/* Функцию извлечения квадратного корня не использовать. */
void task6()
{
	unsigned int n, k = 1;
	
	printf("Enter the natural number `n`: ");
	scanf("%d", &n);
	while(k*k <= n)
		k++;
	printf("The first number that satisfies the condition `k^2 > n` is %d\n", k);
}


/* Для двух целых положительных чисел `a` и `b` найти их НОК */
int gcd(int a, int b)
{
	return b ? gcd(b, a % b) : a;
}


int lcm(int a, int b)
{
	return a*b / gcd(a, b);
}


/* Подсчитать количество трёхзначных натуральных чисел, в записи которых есть две одинаковые цифры. */
int* digits(int n, int *arr)
{
	int i = 0;
	while(n != 0) {
		arr[i] = n%10;
		n /= 10;
		i++;
	}
	return arr;
}


int same_nums(int n, int length)
{
	int arr[length], same = 0;
	digits(n, arr);

	for(int i = 0; i < length-1; i++) {
		for(int j = i; j < length; j++) {
			if (i != j && arr[i] == arr[j])
				same++;
		}
	}
	return same;
}


void task8()
{
	int counter = 0;
	for(int i = 100; i < 1000; i++)
		if(same_nums(i, 3) == 1)
			counter++;
	printf("The number of three-digit numbers in which there are two identical digits is  %d\n", counter);
}


/* Подсчитайте количество трёхзначных натуральных чисел, в записи которых все три цифры различны */
void task9()
{
	int counter = 0;
	for(int i = 100; i < 1000; i++)
		if(same_nums(i, 3) == 0)
			counter++;
	printf("The number of three-digit numbers in which all numbers are different is %d\n", counter);
}


int main()
{
	task9();
	/*printf("%d\n", gcd(24, 36));*/
	return 0;
}
