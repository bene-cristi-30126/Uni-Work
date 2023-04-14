#include <stdio.h>
#include <stdlib.h>
#define M 47

typedef struct student
{
    int cheie;
    char nume[50], prenume[50];
    double media;
    struct student *urm;
}STUDENT;

STUDENT *prim=0, *ultim=0;

int f(char nume[50], char prenume[50])
{
    int i, suma=0;
    for(i = 0; i < strlen(nume); i++) suma += nume[i];
    for(i = 0; i < strlen(prenume); i++) suma += prenume[i];
    return suma%M;
}

STUDENT *sparge(char *buf)
{
    char *result;
    int i=0;
    STUDENT *d=(STUDENT*)malloc(sizeof(STUDENT)); ///se aloca spatiu pentru datele despre fiecare student
    result=strtok(buf,",");
    while (result)
    {
        switch (i)
        {
            case 0:
            {
                strcpy(d->nume,result);
                break;
            }
            case 1:
            {
                strcpy(d->prenume,result);
                break;
            }
            case 2:
            {
                d->media=atof(result); ///functia atoi transforma char in int
                break;
            }
        }
        i++; ///luam urmatorul element
        result=strtok(NULL,",");
    }
    d->cheie=f(d->nume,d->prenume);
    STUDENT *p=(STUDENT*)malloc(sizeof(STUDENT));
    p=d;
    return p;
}

void adaugare(STUDENT *p)
{
    if(prim==NULL)
    {
        prim=ultim=p;
        p->urm=0;
    }
    else
    {
        p->urm=prim;
        prim=p;
    }
}

void citire()
{
    FILE *f = fopen("student.txt", "r");
    if(f == NULL)
    {
        printf("NU s-a deschis fisierul student.txt...");
        getch();
        exit(0);
    }
    char buf[100];
    while(!feof(f))
    {
        buf[0] = '\0';
        fgets(buf, 100, f);
        if(strlen(buf)>0) adaugare(sparge(buf));
    }
    fclose(f);
}

void afisare()
{
    STUDENT *p=prim;
    while(p)
    {
        printf("Studentul cu cheia %d are numele: %s, prenumele: %s si media: %.2lf\n", p->cheie,p->nume,p->prenume,p->media);
        p=p->urm;
    }
    printf("\n");
}

void cautare() ///cautare dupa cheia k
{
    STUDENT *p=prim;
    int k,ok=0;
    printf("Dati cheia studentului pe care il cautati: ");
    scanf("%d",&k);
    while(p)
    {
        if(p->cheie==k)
        {
            printf("Studentul cautat are caracteristicile: cheiea %d, numele %s, prenumele %s si media %.2lf\n",
                    p->cheie,p->nume,p->prenume,p->media);
            ok=1;
        }
        p=p->urm;
    }
    if(!ok) printf("Studentul cautat nu a fost gasit!\n");
    printf("\n");
}

void modificare()
{
    STUDENT *p=prim;
    char nume[50],prenume[50];
    double medie;
    int k;
    printf("Dati cheia studentului ale carui date doriti sa le modificati: ");
    scanf("%d",&k);
    printf("Dati noul nume: ");
    scanf("%s",nume);
    printf("Dati noul prenume: ");
    scanf("%s",prenume);
    printf("Dati noua medie: ");
    scanf("%lf",&medie);
    while(p)
    {
        if(p->cheie==k)
        {
            p->cheie=f(nume,prenume);
            strcpy(p->nume, nume);
            strcpy(p->prenume, prenume);
            p->media = medie;
            printf("Modificarea a avut loc cu succes!\nNoul student are caracteristicile urmatoare: cheiea %d, numele %s, prenumele %s si media %.2lf",
                    p->cheie,p->nume,p->prenume,p->media);
        }
        p = p->urm;
    }
    printf("\n\n");
}

void stergere()
{
    int cheie;
    printf("Dati cheia studentului pe care doriti sa il stergeti: ");
    scanf("%d",&cheie);
    if(prim==NULL)  ///daca lista e vida
    {
        printf("Nu exista studenti!\n");
        return;
    }
    if(prim->cheie==cheie)  ///daca e primul element
    {
        STUDENT *p=prim;
        printf("Studentul care va fi sters are caracteristicile urmatoare: cheiea %d, numele %s, prenumele %s si media %.2lf\n",
                    p->cheie,p->nume,p->prenume,p->media);
        prim=prim->urm;
        free(p);
        return ;
    }
    STUDENT *p=prim;
    while(p->urm!=NULL && p->urm->cheie!=cheie) p=p->urm;   //caut predecesor
    if(p->urm!=NULL)
    {
        STUDENT *q=p->urm;
        p->urm=p->urm->urm;
        printf("Studentul care va fi sters are caracteristicile urmatoare: cheiea %d, numele %s, prenumele %s si media %.2lf\n",
                    q->cheie,q->nume,q->prenume,q->media);
        free(q);
    }
}

void salvare(char *fisier)
{
    FILE *f = fopen(fisier, "w");
    if(f==NULL)
    {
        printf("\nNu se poate deschide fisierul!\n");
        exit(0);
    }
    STUDENT *p=prim;
    while(p->urm!=NULL)
    {
        fprintf(f,"%s,",p->nume);
        fprintf(f,"%s,",p->prenume);
        fprintf(f,"%.2lf\n",p->media);
        p=p->urm;
    }
    if(p->urm==NULL)
    {
        fprintf(f,"%s,",p->nume);
        fprintf(f,"%s,",p->prenume);
        fprintf(f,"%.2lf",p->media);
    }
    fclose(f);
}

int main()
{
    int op;
    printf("1 Adaugare, 2 Modificare, 3 Stergere, 4 Afisare, 5 Cautare, 6 Salvare, 7 Terminare\n");
    while(1)
    {
        scanf("%d",&op);
        switch(op)
        {
            case 1:
                {
                    citire();
                    break;
                }
            case 2:
                {
                    modificare();
                    break;
                }
            case 3:
                {
                    stergere();
                    break;
                }
            case 4:
                {
                    afisare();
                    break;
                }
            case 5:
                {
                    cautare();
                    break;
                }
            case 6:
                {
                    salvare("student.txt");
                    getch();
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
