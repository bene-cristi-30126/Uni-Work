#ifndef CLASE_H
#define CLASE_H
#include <iostream>

class Vechile
{
private:
	long long int km;
public:
	int horse_power;
	int year_of_fabrication;

	Vechile( int a, int b ) :  year_of_fabrication{ a }, horse_power{ b }
	{
		std::cout << "Masina din "<<year_of_fabrication<<" de "<<horse_power<<" de cai putere"<<std::endl;
	}
};

class Family_car : public Vechile
{
public:
	int number_of_seats;
	double lugage_space;

	Family_car(int a) : Vechile{ a, 0}
	{
		std::cout << "Masina din " << year_of_fabrication;
	}
};


#endif CLASS_H
