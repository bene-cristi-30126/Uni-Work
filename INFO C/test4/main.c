#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define M 11

typedef struct nave
{
    int identificator;
    char nava[30];
    char batalie[30];
    char rezultat[30];
    char data[30];
    struct nave *urm;
}nod;

nod* HT[M];

int dispersie(int identificator)
{
    return identificator%M;
}


void citire()
{
    FILE *f=fopen("BATALIE.TXT","r");
    if(f==NULL)
    {
        printf("Fisereul nu a putut fi deschis!");
        exit(1);
    }
    nod *p;
    int key, i;
    char buf[100], deli[]=",", *result=NULL;

    while(!feof(f))
    {
        p=(nod*)malloc(sizeof(nod));
        fgets(buf,100,f);
        result=strtok(buf,deli);
        i=0;

        while(result !=NULL)
        {
            switch(i)
            {
            case 0:
                {
                    p->identificator=atoi(result);
                    break;
                }
            case 1:
                {
                    strcpy(p->nava, result);
                    break;
                }
            case 2:
                {
                    strcpy(p->batalie, result);
                    break;
                }
            case 3:
                {
                    strcpy(p->rezultat, result);
                    break;
                }
            case 4:
                {
                    strcpy(p->data, result);
                    break;
                }
            }
            i++;
            result=strtok(NULL,deli);
        }
        if(p->identificator==0 || strcmp(p->nava," ")==0)
            free(p);
        key=dispersie(p->identificator);
        if(HT[key]==0)
            p->urm=0;
        else
            p->urm=HT[key];
        HT[key]=p;
    }
}

nod* cautare(int id)
{
    int key, ok=0;
    nod *p;
    key=dispersie(id);
    p=HT[key];
    while(p)
    {
        if(id==p->identificator )
        {
            printf("Nava %d %s %s %s %s a fost gasita\n",p->identificator, p->nava, p->batalie, p->rezultat,p->data);
            ok=1;
            return p;

        }
        p=p->urm;
    }
    if(ok==0)
        printf("\nNava nu a fost gasit ");
    return 0;
}

void stergere(nod *p)
{
    int h = dispersie(p->identificator);

    nod *q = (nod *)malloc(sizeof(nod));
    q = HT[h];

    if (q->identificator== p->identificator)
    {
        HT[h] = q->urm;
        printf("\nNava %d %s %s %s %s a fost sters",p->identificator, p->nava, p->batalie, p->rezultat,p->data);

        free(q);
    }
    else
    {
        while (q->urm)
        {
            if (q->urm->identificator == p->identificator)
            {
                q->urm = q->urm->urm;
                printf("\nNava %d %s %s %s %s a fost sters",p->identificator, p->nava, p->batalie, p->rezultat,p->data);

                free(p);
                break;
            }
            q = q->urm;
        }
    }
}

void afisare()
{
    for(int i = 1;i < M; i++)
     if(HT[i] != 0)
     {
        nod *p = HT[i];
        while(p != 0)
        {
         printf("%d   %s   %s   %s   %s\n",p->identificator, p->nava, p->batalie, p->rezultat,p->data);
         p = p->urm;
        }
        free(p);
     }
}

int main()
{
    int r;

    for(int i=0; i<M; i++)
        HT[i]=0;
    citire();

    int op;
    printf("1 Cautare, 2 Afisare, 3 Stergere, 4 Terminare\n");
    while(1)
    {
        scanf("%d",&op);
        switch(op)
        {
            case 1:
                {
                    printf("\n Introduceti Identificator pentru cautare: ");
                    scanf("%d", &r);
                    cautare(r);
                    break;
                }
            case 2:
                {
                    afisare();
                    break;
                }
            case 3:
                {
                    printf("\n Introduceti Identificator pentru stergere: ");
                    scanf("%d", &r);
                    nod *p=cautare(r);
                    stergere(p);
                    break;
                }
            case 4:
                {
                    printf("La revedere!");
                    return 0;
                }
            default:
            {
                printf("Optiune gresita!\n");
                break;
            }
        }
    }
}


