#include <stdio.h>


/* Вычислите среднее арифметическое пяти целых значений, введенных с клавиатуры. */
void task_1()
{
    int n = 5, sum = 0;
    int A[n];

    printf("Enter five integer numbers:\n");
    for(int i = 0; i < n; i++) scanf("%d", &A[i]);
    
    printf("Your numbers:\n");
    for(int i = 0; i < n; i++) { 
        printf("%d ", A[i]);
        sum += A[i];
    }

    printf("\nAverage: %d\n", sum/n);
}


/* Напишите программу, считывающую целое число, а затем определяющую, четное оно или нечетное, и выводящую эту информацию на печать. */
void task_2()
{
    int n;
    printf("Enter the integer number:\n");
    scanf("%d", &n);
    printf("Number is %s\n", n%2 != 0 ? "odd" : "even");
}


/* Напишите с использованием оператора while программу, которая вычисляет сумму целых чисел от 1 до 10. */
void task_3()
{
    int sum = 0, i = 1;
    while(i < 11) {
        sum += i;
        i++;
    }
    printf("Sum of numbers from 1 to 10 is %d\n", sum);
}


/* Напишите программу с помощью оператора while для расчета x в степени y. */
void task_4()
{
    int x, y, i = 0, res = 1;
    printf("Enter the base and power (integer):\n");
    scanf("%d %d", &x, &y);
    while(i < y) {
        res *= x;
        i++;
    }
    printf("Result: %d^%d = %d\n", x, y, res);
}


/* Напишите программу, которая считывает пятизначное число и определяет, является ли оно палиндромом. */
void task_5()
{
    int num, rem, org, rev = 0;
    printf("Enter the integer number:\n");
    scanf("%d", &num);
    org = num;
    while(num) {
        rem = num % 10;
        rev = rev * 10 + rem;
        num /= 10;
    }
    printf("Number is %s\n", org == rev ? "palindrome" : "not palindrome");
}


/* Напишите программу, которая считывает целое число и определяет (выводя результат на печать), сколько цифр в этом числе равно 7. */
void task_6()
{
    int num, counter = 0;
    printf("Enter the integer number:\n");
    scanf("%d", &num);
    while(num) {
        if(num % 10 == 7) counter++;
        num /= 10;
    }
    printf("Seven meets %d times\n", counter);
}


/* Напишите программу, которая считывает радиус круга (в виде значения double), вычисляет и выводит значения его диаметра, периметра и площади. Примите для p значение 3,14159. */
void task_7()
{
    double radius, p = 3.14159;
    printf("Enter the radius (double):\n");
    scanf("%lf", &radius);
    printf("Diameter: %.1f\n"
           "Perimeter: %.1f\n"
           "Area: %.1f\n",
           2*radius, 2*p*radius, p*radius*radius);
}


/* Напишите программу, которая считывает неотрицательное целое число, вычисляет и выводит его факториал. */
void task_8()
{
    unsigned int num, factorial = 1;
    printf("Enter the non-negative integer number:\n");
    scanf("%d", &num);
    for(int i = 1; i <= num; i++) factorial *= i;
    printf("%d! = %d\n", num, factorial);
}


int factorial(int n)
{
    int res;
    for(int i = 1; i <= n; i++) res *= i;
    return res;
}


int power(int x, int y)
{
    int i = 0, res = 1;
    while(i < y) {
        res *= x;
        i++;
    }
    return res;
}


/* Напишите программу, которая оценивает значение e^x по формуле разложения в ряд. */
void task_9()
{
    int x, n;
    double exp = 0;

    printf("Enter two integer numbers:\n"
           "`x` - power of exp\n"
           "`n` - approximation level\n");
    scanf("%d %d", &x, &n);

    for(int i = 1; i <= n; i++) exp += (double)power(x, i)/factorial(i);
    printf("exp^%d ~ %.5f\n", x, 1 + exp);
}


int main()
{
    /* Измените цифру для запуска конкретного задания */
    task_9();
    return 0;
}