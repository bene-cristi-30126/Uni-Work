#include <stdio.h>
#include <stdlib.h>
int n;

void asamblare(int A, int B, int controlor, int v[n],int nr_operati)
{

    while(A!=B)
    {
        if(A<B)
        {
            if(A+v[controlor]<=B)  //verificam daca cel mia mare nr din vector incape intre A si B
            {
                A=A+v[controlor];   //actualizam A-ul
                nr_operati++;
                asamblare(A,B,controlor,v,nr_operati);
            }
            else
            {
                controlor--;       //incercam urmatorul
                asamblare(A,B,controlor,v,nr_operati);
            }
        }
        else
        {
            if(A-v[controlor]>=B)  //verificam daca cel mia mare nr din vector incape intre A si B
            {
                A=A-v[controlor];   //actualizam A-ul
                nr_operati++;
                asamblare(A,B,controlor,v,nr_operati);

            }
            else
            {
                controlor--;       //incercam urmatorul
                asamblare(A,B,controlor,v,nr_operati);
            }
        }
    }
    if(A==B)
    {
        printf(" A este %d si numarul de operati este %d\n",A,nr_operati);
        exit(1);
    }
}

int main()
{
    int A,B;
    printf("Introduceti A :\n");
    scanf("%d",&A);
    printf("Introduceti B :\n");
    scanf("%d",&B);

    printf("Introduceti numarul de numere \n");
        scanf("%d", &n);


    int i, j, k, v[n];

        printf("Introduceti elementele vectorului v \n");
        for (i = 0; i < n; ++i)
            scanf("%d", &v[i]);

        for (i = 0; i < n; ++i)
        {

            for (j = i + 1; j < n; ++j)
            {

                if (v[i] > v[j])
                {

                    k =  v[i];
                    v[i] = v[j];
                    v[j] = k;

                }

            }

        }
        asamblare(A,B,n,v,0);

    return 0;
}
