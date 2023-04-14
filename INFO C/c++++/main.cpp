#include <iostream>

using namespace std;

int main()
{
    cout << "Hello world!" << endl;
    int sum=0,v[10],n;
    cin>>n;
    for(int i=0;i<n;i++)
    {
         cin>>v[i];
    sum=sum+v[i];
    }
    cout<<sum;

    return 0;
}
