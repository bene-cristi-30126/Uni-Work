#include <iostream>

using namespace std;

class Base
{
private:
    int value{0};
    int Privuletscu{78};
public:
    /*Base() { cout<<"Apelare constructor BASE cu 0 argument"<<endl;}
    Base(int x):value{0}{cout<<"Apelare BASE constructor cu 1 argument"<<endl;}
    ~Base() { cout<<"Apelare BASE destructor cu 0 argument"<<endl;}*/

    void getvalue() {cout<<Publicescu<<" "<<Privuletscu<<" "<<Protejescu<<endl;}


    int Publicescu;

protected:
    int Protejescu{67};

};

class Derivated : private Base
{
private:
    int value{0};

public:
    //Derivated() { cout<<"Apelare constructor DERIVATED cu 0 argument"<<endl;}
    //Derivated(int x):value{0}{cout<<"Apelare DERIVATED constructor cu 1 argument"<<endl;}
    //~Derivated() { cout<<"Apelare DERIVATED destructor cu 0 argument"<<endl;}

    void getmostenire()
    {
        Publicescu=100;
        //Privuletscu=200;
        //Protejescu=300;
    }
    void getvalue2() {cout<<Publicescu<<" "<<Protejescu<<endl;}

};

int main()
{
    Base a;
    a.Publicescu=689;
    //a.Protejescu=345;
    //a.Privuletscu=4234242;
    a.getvalue();

    Derivated b;
    b.getmostenire();
    b.getvalue2();
    return 0;
}
