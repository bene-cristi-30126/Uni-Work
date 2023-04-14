#ifndef CLASE_H
#define CLASE_H
#include <iostream>

class Chassis {
public:
	double height=10;
	virtual void set_height(double inaltime) = 0;
	virtual double get_height() = 0;
};

class Engine
{
private:
	int RPM=1000;
public:
	void set_RPM(int RPM);
	int get_RPM()
	{
		return RPM;
	};
};

class Vechile:public Chassis
{
private:
	long long int km=200000;
public:
	Engine m;          
	int horse_power=100;
	int year_of_fabrication=1960;

	void set_km(long long int km);
	void get_km()
	{
		std::cout << "This car has done " << km << std::endl;
	};

	void set_height(double inaltime)
	{
		inaltime = height;
	}
	double get_height()
	{
		return height;
	};

	Vechile(int a, int b) : year_of_fabrication{ a }, horse_power{ b }
	{
		std::cout << "This car is from "<<year_of_fabrication<<" with "<<horse_power<<" horse power"<<std::endl;
	}
};

class Roof_Rack
{
public:
	double more_lugage_space = 250;
};

class Family_car : public Vechile
{
public:
	int number_of_seats=4;
	double lugage_space=300;
	friend class Roof_Rack;  
	void set_lugage_space(Roof_Rack& obj)
	{
		lugage_space = obj.more_lugage_space + lugage_space;
	};
	double get_lugage_space()
	{
		return lugage_space;
	};


	Family_car(int a) : Vechile{ a, 0 }
	{
		std::cout << "This car is from " << year_of_fabrication<<std::endl;
	}
};

class Sport_car : public Vechile
{
public:
	double top_speed=120;
	double acceleration=7.5;

	Sport_car(int a, int b) : Vechile{a,b}{}
};

class Rally_car : public Sport_car
{
protected:
	int tune_stage=0;
public:
	void set_tune_stage(int tune_stage);
	int get_tune_stage()
	{
		return tune_stage;
	};
	int camber_angle=0;
	Rally_car(int a, int b) : Sport_car{ a,b } {}
};


#endif CLASS_H