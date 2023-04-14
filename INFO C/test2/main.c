#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct
{
    char nume[50];
    float frecventa;
    int nr_nuclee;
    float diagonala;
    float capacitate;
    float pret;
    char producator[50];
}DATE;

typedef struct nod
{
    DATE *date;
    struct nod *stg,*dr;
}NOD;

NOD *rad;

void inordine (NOD *p, int nivel)
{
    if (p)
    {
        inordine(p->stg,nivel+1);
        printf("%s %.2f %d %.2f %.2f %.2f %s",p->date->nume, p->date->frecventa, p->date->nr_nuclee,
                                                p->date->capacitate,p->date->diagonala, p->date->pret, p->date->producator);
        inordine(p->dr,nivel+1);
    }
}

NOD *info(char *sir)
{

    char *cuv;
    int i=0;
    DATE *d=(DATE*)malloc(sizeof(DATE)); //se aloca spatiu pentru datele despre fiecare medicament
    cuv=strtok(sir,",");

    while (cuv)
    {
        switch (i)
        {
            case 0:{
                strcpy(d->nume,cuv);break;}
            case 1:{
                d->frecventa=atof(cuv);break;}
            case 2:{
                d->nr_nuclee=atoi(cuv); break;}
            case 3:{
                d->diagonala=atof(cuv);break;}
            case 4:{
                d->capacitate=atof(cuv);break;}
            case 5:{
                d->pret=atof(cuv);break;}
            case 6:{
                strcpy(d->producator,cuv);break;}
        }
        i++;
        cuv=strtok(NULL,",");
    }
    NOD *p=(NOD*)malloc(sizeof(NOD));
    p->date=d;
    return p;
}

void adaugare (NOD *p)
{
    NOD *q;
    p->stg=0;
    p->dr=0;
    if (rad==0)
    {
        rad=p;
        return;
    }
    q=rad;
    while(1)
    {
        if (strcmp(p->date->nume,q->date->nume)<0)
            if (q->stg==0)
               {q->stg=p;return;}
             else
                q=q->stg;
          else
            if (strcmp(p->date->nume,q->date->nume)>0)
                   if (q->dr==0)
          {
              q->dr=p;
              return;
          }
          else
          q=q->dr;
          else {
              printf("Laptop-ul exista deja");return;}
    }
}

NOD *cautare (char *key)
{
    NOD *q;
    if (rad==0)
    {
        printf("Arborele este vid");
        return 0;
    }
    q=rad;

    while (q&&strcmp(key,q->date->nume)!=0)
    {
        if(strcmp(key,q->date->nume)<0)
            q=q->stg;
        else if (strcmp(key,q->date->nume)>0)
                   q=q->dr;
    }
    if(q==0)
    {
        printf("Laptop-ul nu exista ");
        return 0;
    }
    return q;
}

NOD *stergere_nod(NOD *rad, char *k)
{
    NOD *p, *tata_p;
    NOD *nod_inlocuire, *tata_nod_inlocuire;
    int directie;
    if(rad == NULL) return NULL;
    p = rad;
    tata_p = NULL;
    while((p != NULL) && (strcmp(p->date->nume,k)!=0))
    {
        if (strcmp(k,p->date->nume)<0)
        {
            tata_p = p;
            p = p->stg;
            directie = 1;
        }
        else
        {
            tata_p = p;
            p = p->dr;
            directie = 2;
        }
    }
    if(p == NULL)
    {
        printf("\n Nu exista laptop-ul =%s\n", k);
        return rad;
    }
    /* s-a găsit nodul p de cheie k */
    if(p->stg == NULL)
        nod_inlocuire = p->dr; // nodul de șters p nu are fiu stâng
        else
            if(p->dr == NULL)
                nod_inlocuire = p->stg; // nodul de șters p nu are fiu drept
            else
            { // nodul de șters p are fiu stâng și fiu drept
                tata_nod_inlocuire = p;
                nod_inlocuire = p->dr; // se caută în subarborele drept
                while(nod_inlocuire->stg != NULL)
                {
                    tata_nod_inlocuire = nod_inlocuire;
                    nod_inlocuire = nod_inlocuire->stg;
                    }
                    if(tata_nod_inlocuire != p)
                    {
                        tata_nod_inlocuire->stg = nod_inlocuire->dr;
                        nod_inlocuire->dr = p->dr;
                    }
                    nod_inlocuire->stg = p->stg;
            }
            free(p);
            printf("\n laptop-ul=%s a fost sters!\n", k);
            if(tata_p == NULL)
                return nod_inlocuire; // s-a șters chiar rădăcina inițială
            else
            {
            if (directie == 1)
                tata_p->stg = nod_inlocuire;
            else
                tata_p->dr = nod_inlocuire;
            return rad;
            }
}

int main()
{
    char sir[50],c[50];
    NOD *n=(NOD*)malloc(sizeof(NOD));

    FILE *f;
    f=fopen("LAPTOP.txt","r");
    if (f==NULL)
    {
        printf("Fisierul nu s-a putut deschide.");
        exit(1);
    }
    while (!feof(f))
    {
        strcpy(sir,"NULL");

        fgets(sir,50,f);

        if (strcmp(sir,"NULL")!=0)

            adaugare(info(sir));

    }

    int optiune;
    printf("1 Cautare, 2 Afisare, 3 Stergere \n");
    while(1)
    {
        scanf("%d", &optiune);
        switch(optiune)
        {
            case 1:
            {
                printf("\n Intoduceti pe care doriti sa il cautati:");
                scanf("%s",c);

                n=cautare(c);
                if(n!=0)
                {
                    printf(" exista si are informatiile: \n");
                    printf("%s %.2f %d %.2f %.2f %.2f %s",n->date->nume,n->date->frecventa,n->date->nr_nuclee,
                                                  n->date->diagonala,n->date->capacitate,n->date->pret,n->date->producator);
                }
                break;
            }
            case 2:
            {
                inordine(rad,0);
                break;
            }
            case 3:
                {
                    printf("\n Intoduceti laptopul pe care doriti sa il stergeti:");
                    scanf("%s",c);
                    rad=stergere_nod(rad,c);
                    break;
                }

            default:
            {
                printf("Optiune gresita...");
                break;
            }
        }
    }
    fclose(f);
    return 0;
}
