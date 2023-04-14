#include <iostream>
#include "BeneAdrianCristian_Lab4.h"
using namespace std;


int main()
{
	Vechile BMW(1984,75);
	Family_car Transporter(2000);
	Roof_Rack bara;
	Transporter.set_lugage_space(bara);
	std::cout<<"This car has a capacity of "<<Transporter.get_lugage_space()<<" liters"<<std::endl;


	Sport_car Audi(2020, 600);
	Rally_car Golf(2000, 900);
	std::cout << " " << std::endl;
	
	std::cout << BMW.m.get_RPM() << "Revs/minute" << std::endl; 

	Chassis* Ford_Focus = new Rally_car(2000,600);             
	Ford_Focus->set_height(15);

	return 0;
}