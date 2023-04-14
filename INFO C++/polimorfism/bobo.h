#ifndef BOBO_H
#define BOBO_H

class base_interface {
    public:
        virtual void getAge() = 0;
        virtual void getHealth() = 0;
};

class Age_and_health final {
    public:
        int age;
        string health;

        void setAge() {
            age = rand() % 100 + 1;
        }
        void setHealth(int age) {
            if(age >= 1 && age <= 40) health = "good";
            if(age > 40 && age <= 60) health = "degrading";
            if(age > 60) health = "not-so-good";
        }
};

class Person : public base_interface
{
    public:
        Age_and_health status;

        int weight;
        int height;
        long long int SocialSecurityNumber;

        Person(int my_weight, int my_height, long long int my_cnp) : weight{my_weight},
        height{my_height}, SocialSecurityNumber{my_cnp} {
            cout<<"A person!"<<endl;
        }

        virtual void getAge() {
            cout<<status.age<<endl;
        }

        void set_health() {
            status.setHealth(status.age);
        }

        virtual void getHealth() {
            cout<<status.health<<endl;
        }
};

class Student : public Person
{
    public:
        string University;
        Student(long long int my_cnp) : Person(0, 0, SocialSecurityNumber) {
            cout<<"A student!"<<endl;
        }

    protected:
        double gradeGPA;
};

class Teacher : public Person
{
    public:
        Teacher(long long int my_cnp) : Person(0, 0, SocialSecurityNumber) {
            cout<<"A teacher!"<<endl;
        }
        string University;
        int experience;
};

class Researcher : public Teacher
{
    public:
        string domain;
        bool PhD;
        int number_of_projects_involved;
};

class Administrator
{
    friend class Student;
    public:
        int No_of_students;
};
#endif
