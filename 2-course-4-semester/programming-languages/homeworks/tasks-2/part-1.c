#include <stdio.h>
#include <limits.h>


/*  Напишите программу, которая суммирует последовательность целых чисел.
    Первое целое число, считываемое с помощью scanf, определяет количество значений, которое осталось ввести.
    Программа должна считывать только одно значение при каждом выполнении scanf.
    Например, 5 100 200 300 400 500 где 5 указывает, что должны суммироваться последующие 5 значений.
*/
void task1()
{
    int n, inupt_num, sum = 0;
    printf("Enter the `count` of numbers:\n");
    scanf("%d", &n);
    printf("Enter %d  integer numbers:\n", n);
    for(int i = 0; i < n; i++) {
        scanf("%d", &inupt_num);
        sum += inupt_num;
    }
    printf("The sum of this numbers is %d\n", sum);
}


/* Напишите программу, которая находит наименьшее из нескольких целых чисел. Первое считанное значение определяет количество оставшихся значений. */
void task2()
{
    int n, input_num, min = INT_MAX;
    printf("Enter the `count` of numbers:\n");
    scanf("%d", &n);
    printf("Enter %d integer numbers:\n", n);
    for(int i = 0; i < n; i++) {
        scanf("%d", &input_num);
        if(input_num < min) min = input_num;
    }
    printf("The minimum of this numbers is %d\n", min);
}


/* Найдите сумму всех нечётных (`s_1`) и сумму всех чётных (`s_2`) целых чисел в диапазоне от 1 до 100. */
void task3()
{
    int s[2] = {0, 0};
    for(int i = 1; i <= 100; i++) ((i % 2) != 0) ? (s[0] += i) : (s[1] += i);
    printf("The sum of odd integer numbers is %d\n"
           "The sum of even integer numbers is %d\n",
           s[0], s[1]);
}


/* Дано натуральное число `n`, вычислить факториал этого числа. */
int factorial(unsigned int n)
{
    return n == 0 ? 1 : n * factorial(n - 1);
}


/* Дано целое число `n` > 0. Определить, является ли оно степенью числа 3. */
void task5()
{
    unsigned int n;
    printf("Enter the `n` number:\n");
    scanf("%d", &n);
    printf("%s\n", n % 3 == 0 ? "Number is power 3" : "Number isn't power 3");
}


int main()
{
    /* Измените цифру для запуска конкретного задания */
    task5();
    
    // printf("%d\n", factorial(1));
    return 0;
}