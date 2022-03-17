#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <unistd.h>


#define N 4


class Satellite {
private:
	double min, max;
public:
	Satellite(double a_min, double a_max)
		{ min = a_min; max = a_max; }
	double get_value() {
		return min + ((float)rand()*(max-min)/(float)RAND_MAX);
	}
};


double mean(double values[N]) {
	double sum = 0;
	for(int i = 0; i < N; i++)
		sum += values[i];
	return sum/N;
}


// Написать с использованием возможностей ООП (на С++) программу для наземной станции, которая собирает сведения (случайно заданные вещественные значения) от четырех спутников в реальном времени и с периодичностью 5 секунд определяет позицию (например, среднее арифметическое) GPS-приемника пользователя.
// Использование программы './task-1 n', где n - количество итераций
int main(int argc, char *argv[]) {

	if(argc < 2) {
		printf("ERROR: Enter number of iterations\n");
		exit(1);	
	}
	
	if(!atoi(argv[1])) {
		printf("ERROR: Bad input number conversion\n");
		exit(1);
	}

	srand(time(NULL));
	int n = atoi(argv[1]);
	double a = 0.0, b = 10.0, values[N];
	Satellite s1(a, b), s2(a+2, 2*b), s3(a+5, b+5), s4(a+1, 3*b);
	Satellite satellites[N] = {s1, s2, s3, s4};
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < N; j++) {
			values[j] = satellites[j].get_value();
			usleep(500);
		}
		printf("%d seconds: ", (i+1)*5);
		for(int j = 0; j < N; j++)
			printf("(%d) %f, ", j+1, values[j]);
		printf("Mean: %f\n", mean(values));
		usleep(3000);
	}

	return 0;
}
