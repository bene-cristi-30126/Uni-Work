#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define M 11

typedef struct furnizori
{
    int id;
    char nume[30];
    int stare;
    char oras[20];
    char serviciu[30];
    struct furnizori *urm;
}nod;

nod* HT[M];

int dispersie(char nume[50])
{
    int i, suma=0;
    for(i = 0; i < strlen(nume); i++) suma+=nume[i];
    return suma%M;
}

void citire()
{
    FILE *f=fopen("FURNIZOR.txt","r");
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
                    p->id=atoi(result);
                    break;
                }
            case 1:
                {
                    strcpy(p->nume, result);
                    break;
                }
            case 2:
                {
                    p->stare=atoi(result);
                    break;
                }
            case 3:
                {
                    strcpy(p->oras, result);
                    break;
                }
            case 4:
                {
                    strcpy(p->serviciu, result);
                    break;
                }
            }
            i++;
            result=strtok(NULL,deli);
        }
        if(p->id==0 || strcmp(p->nume," ")==0)
            free(p);
        key=dispersie(p->nume);
        if(HT[key]==0)
            p->urm=0;
        else
            p->urm=HT[key];
        HT[key]=p;
    }
}

nod* cautare(char *nume)
{
    int key;
    nod *p;
    int ok=0;
    key=dispersie(nume);
    p=HT[key];

    while(p)
    {
        if(strcmp(nume,p->nume)==0)
        {
            printf("\nFurnizorul %d %s %d %s %s a fost gasit",p->id, p->nume, p->stare, p->oras,p->serviciu);
            ok=1;
            return p;
        }
        p=p->urm;
    }
    if(ok==0)
        printf("\nFurnizorul nu a fost gasit");
    free(p);
    return 0;
}

void stergere(nod *p)
{
    int h = dispersie(p->nume);

    nod *q = (nod *)malloc(sizeof(nod));
    q = HT[h];

    if (q->nume == p->nume)
    {
        HT[h] = q->urm;
        printf("\nFurnizorul %d %s %d %s %s a fost sters",p->id, p->nume, p->stare, p->oras,p->serviciu);

        free(q);
    }
    else
    {
        while (q->urm)
        {
            if (q->urm->nume == p->nume)
            {
                q->urm = q->urm->urm;
                printf("\nFurnizorul %d %s %d %s %s a fost sters",p->id, p->nume, p->stare, p->oras,p->serviciu);

                free(p);
                break;
            }
            q = q->urm;
        }
    }
}

nod* modificare(char *nume)
{
    int key, ok=0;
    nod *p;
    key=dispersie(nume);
    p=HT[key];

    while(p)
    {
        if(strcmp(nume,p->nume)==0)
        {

            printf("Dati id: ");       scanf("%d",&p->id);
            printf("Dati nume: ");     scanf("%s",p->nume);
            printf("Dati stare: ");    scanf("%d",&p->stare);
            printf("Dati oras: ");     scanf("%s",p->oras);
            printf("Dati serviciu: "); scanf("%s",p->serviciu);
            printf("\nFurnizorul %d %s %d %s %s a fost gasit",p->id, p->nume, p->stare, p->oras,p->serviciu);
            ok=1;
            return p;
        }
        p=p->urm;
    }
    if(ok==0)
        printf("\nFurnizorul nu a fost modificat");
    free(p);
    return 0;
}

void adaugare()
{
    int ok=0;
    nod *p = (nod*)malloc(sizeof(nod));
    printf("Dati id: ");
    scanf("%d",&p->id);
    printf("Dati nume: ");
    scanf("%s",p->nume);
    printf("Dati stare: ");
    scanf("%d",&p->stare);
    printf("Dati oras: ");
    scanf("%s",p->oras);
    printf("Dati serviciu: ");
    scanf("%s",p->serviciu);
    int h = dispersie(p->nume);
    if(HT[h] == 0)
    {
         HT[h] = p;
         p->urm = 0;
    }
    else
    {
        nod *temp = (nod*)malloc(sizeof(nod));
        while(temp)
        {
            if(strcmp(temp->nume,p->nume)==0)
            {
                printf("Furnizorul exista deja");
                printf("\n%d %s %d %s %s ",p->id, p->nume, p->stare, p->oras,p->serviciu);
                ok=1;
            }
            temp=temp->urm;
        }
        if(ok==0)
        {
            p->urm = HT[h];
            HT[h] = p;
	    free(p);
        }
    }
	free(temp);
}


void afisare()
{
    for(int i = 1;i < M; i++)
     if(HT[i] != 0)
     {
        nod *p = HT[i];
        while(p != 0)
        {
         printf("%d %s %d %s %s\n",p->id, p->nume, p->stare, p->oras,p->serviciu);
         p = p->urm;
        }
     }
     free(p);
}

void salvare(char *fisier)
{
    FILE *f = fopen(fisier, "w");
    if(f==NULL)
    {
        printf("\nNu se poate deschide fisierul!\n");
        exit(0);
    }
    for(int i = 1;i < M; i++)
     if(HT[i] != 0)
     {
        nod *p = HT[i];
        while(p != 0)
        {
         if(p->urm!=NULL)
         {
            fprintf(f,"%d %s %d %s %s\n",p->id, p->nume, p->stare, p->oras,p->serviciu);
            p = p->urm;
         }
         else
            fprintf(f,"%d %s %d %s %s",p->id, p->nume, p->stare, p->oras,p->serviciu);
        }
     }
    free(p);
    fclose(f);
}

int main()
{
    char r[30];

    for(int i=0; i<M; i++)
        HT[i]=0;
    citire();

    int op;
    printf("1 Cautare, 2 Afisare, 3 Stergere, 4 Modificare, 5 Adaugare, 6 Salvare, 7 Terminare\n");
    while(1)
    {
        scanf("%d",&op);
        switch(op)
        {
            case 1:
                {
                    printf("\n Introduceti Nume pentru cautare: ");
                    scanf("%s", r);
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
                    printf("\n Introduceti Nume pentru stergere: ");
                    scanf("%s", r);
                    nod *p=cautare(r);
                    stergere(p);
                    break;
                }
            case 4:
                {
                    printf("\n Introduceti Nume pentru cautare: ");
                    scanf("%s", r);
                    modificare(r);
                    break;
                }
            case 5:
                {
                    adaugare();
                    break;
                }
            case 6:
                {
                    salvare("FURNIZOR.txt");
                    break;
                }
            case 7:
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

