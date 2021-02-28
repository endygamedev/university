#include <stdio.h>
#include <math.h>


/*Задание 1*/
double distance(int x1, int y1, int x2, int y2)
{
	return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
}


/*Задание 2*/
int gcd(int x, int y)
{
	return y != 0 ? gcd(y, x % y) : x;
}


/*Задание 3*/
int int_reverse(int num)
{
	int rev = 0;
	do {
		rev *= 10;
		rev += num % 10;
	} while((num /= 10) != 0);
	return rev;
}


/*Задание 4*/
int is_prime(int num)
{
	if(num <= 3)
		return num > 0;
	if(num % 2 == 0 || num % 3 == 0)
		return 0;
	int i = 5;
	while(i*i <= num) {
		if(num % i == 0 || num % (i + 2) == 0)
			return 0;
		i += 6;
	}
	return 1;
}


/*Задание 5*/
double minimum(double x1, double x2, double x3)
{
	double min = INFINITY, num[3] = {x1, x2, x3};
	int i;
	for(i = 0; i < 3; i++)
		if(num[i] < min)
			min = num[i];
	return min;
}


/*Задание 6*/
int factorial(int num)
{
	return num > 1 ? num * factorial(num - 1) : 1;
}


int main()
{
	/*printf("%f", distance(2, 5, 3, 3));*/
	/*printf("%d", gcd(24, 36));*/
	/*printf("%d", int_reverse(123));*/
	/*printf("%s", is_prime(12) ? "Prime" : "Composite");*/
	/*printf("%f", minimum(1.23, -1.1023, 1000.1));*/
	/*printf("%d", factorial(5));*/
	return 0;
}
