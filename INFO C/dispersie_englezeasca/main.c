#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define M 20

typedef struct elev
{
    int key;
    char nume[20];
    int nota;
    struct elev *urm;
}Elev;

Elev* HT[M];
Elev* dummyItem;
Elev* item;

int f(int key)
{
    return key%M;
}

/*int f(char *nume)
{
    int i, suma=0;
    for(i = 0; i < strlen(cheie); i++)
    suma += *(cheie + i);
    return suma%M;
}*/

Elev *cautare(int key)
{
    int index=f(key);

    while(HT[index] !=NULL)
    {
        if(HT[index]->key== key )
            return HT[index];

        ++index;

        index %=M;

    }
    return NULL;
}

void adaugare(int key, int nota)
{
    Elev *item=(Elev*)malloc(sizeof(Elev));

    int index=f(key);

    while(HT[index]!=NULL && HT[index]->nume!=0)
    {
        ++index;

        index%=M;
    }
    HT[index]=item;
}

Elev *stergere(Elev* item)
{
    int key=item->key;

    int index=f(key);

    while(HT[index] !=NULL)
    {
        if(HT[index]->key==key)
        {
            Elev *temp =HT[index];

            HT[index]=dummyItem;
            return temp;
        }
        ++index;

        index%=M;
    }
    return NULL;
}

void afisare()
{
    for(int i=0; i<M; i++)
    {
        if(HT[i] !=NULL)
            printf("(%s,%d)",HT[i]->key,HT[i]->nota);
        else
            printf("~~");
    }
    printf("\n");
}


int main()
{
    dummyItem=(struct Elev*)malloc(sizeof(Elev));
    dummyItem->key=-1;
    dummyItem->nota=-1;

    adaugare(1,20);
    adaugare(2,70);
    adaugare(3,80);
    adaugare(4,25);
    adaugare(5,44);
    adaugare(6,32);
    adaugare(7,11);
    adaugare(8,78);
    adaugare(9,97);

    afisare();
    item=cautare(2);
    if(item!=NULL)
        printf("Nota studentului cautat este: %d\n",item->nota);
    else
        printf("Studentul nu a fost gasit: \n");

    stergere(item);
    item=cautare(6);
    if(item!=NULL)
        printf("Nota studentului cautat este: %d\n",item->nota);
    else
        printf("Studentul nu a fost gasit: \n");
    return 0;
}
