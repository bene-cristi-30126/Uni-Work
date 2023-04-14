#include <iostream>
#include "bobo.h"

using namespace std;

base_interface::base_interface(){}

int main()
{
    Person Andrei(100, 180, 5010309233855);

    Student Mihai(5990204123555);
    Mihai.status.setAge();
    Mihai.status.setHealth(Mihai.status.age);
    Mihai.getAge();
    Mihai.set_health();
    Mihai.getHealth();
return 0;
}
