#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    char nume[50];
    int pret;
    int cantitate;
    char data_p[50];
    char data_e[50];
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
        printf("%s %d %d %s %s",p->date->nume,p->date->pret,p->date->cantitate,p->date->data_p,p->date->data_e);
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
                d->pret=atoi(cuv);break;}
            case 2:{
                d->cantitate=atoi(cuv); break;}
            case 3:{
                strcpy(d->data_p,cuv);break;}
            case 4:{
                strcpy(d->data_e,cuv);break;}
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
              printf("Medicamentul exista deja");return;}
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
        printf("Medicamentul nu exista ");
        return 0;
    }
    return q;
}

void Actualizare( NOD *p, int pret)
{
    p->date->pret = pret;
}

NOD *stergere_nod(NOD *rad, char *k)
{
    NOD *p, *tata_p;
    /* p este nodul de șters, iar tata_p este tatăl lui */
    NOD *nod_inlocuire, *tata_nod_inlocuire;
    /*nodul care il va inlocui pe p și tatăl său */
    int directie; // st=1, dr=2
    if(rad == NULL) return NULL; // arborele este vid
    p = rad;
    tata_p = NULL;
    /* căutare nod cu cheia k */
    while((p != NULL) && (strcmp(p->date->nume,k)!=0))
    {
        if (strcmp(k,p->date->nume)<0)
        { // căutare în stânga
            tata_p = p;
            p = p->stg;
            directie = 1;
        }
        else
        { // căutare în dreapta
            tata_p = p;
            p = p->dr;
            directie = 2;
        }
    }
    if(p == NULL)
    {
        printf("\n Nu exista medicamenul =%s\n", k);
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
            printf("\nMedicamentul =%s a fost sters!\n", k);
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


void Salvare (FILE *f,NOD *p, int nivel)
{
    if (p)
    {
        Salvare(f,p->stg,nivel+1);
        fprintf(f,"%s,%d,%d,%s,%s",p->date->nume,p->date->pret,p->date->cantitate,p->date->data_p,p->date->data_e);
        Salvare(f,p->dr,nivel+1);
    }
}


int main()
{
    char sir[50],c[50];
    NOD *n=(NOD*)malloc(sizeof(NOD));
    int pret;

    FILE *f;
    f=fopen("medicamente.txt","r");
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
    printf("1 Cautare, 2 Afisare, 3 Actualizare, 4 Eliminare, 5 Expirare, 6 Salvare  \n");
    while(1)
    {
        scanf("%d", &optiune);
        switch(optiune)
        {
            case 1:
            {
                printf("\n Intoduceti medicamentul pe care doriti sa il cautati:");
                scanf("%s",&c);

                n=cautare(c);
                if(n!=0)
                {
                    printf("Medicamentul exista si are informatiile: \n");
                    printf("%s %d %d %s %s",n->date->nume,n->date->pret,n->date->cantitate,n->date->data_p,n->date->data_e);
                }
                break;
            }
            case 2:
            {
                inordine(rad,0);
                printf("/n%s\n",rad->date->nume);
                break;
            }
            case 3:
            {
                printf("\n Intoduceti medicamentul pe care doriti sa il actualizati:");
                scanf("%s",&c);
                n=cautare(c);

                printf("Introduceti  noul pret:");
                scanf("%d",&pret);
                Actualizare(n,pret);
                break;
            }
            case 4:
                {
                    printf("\n Intoduceti medicamentul pe care doriti sa il stergeti:");
                    scanf("%s",&c);
                    rad=stergere_nod(rad,c);
                    break;
                }
            case 5:
                {
                    printf("Introduceti data expirari");
                    scanf("%s",&c);
                    if(strcmp(n->date->data_e,c)<=0)
                        rad=stergere_nod(rad,c);
                    break;
                }

            case 6:
            {
                f=fopen("medicamente.txt","w");
                if (f==NULL)
                {printf("Fisierul nu s-a putut deschide.");exit(1);}
                Salvare(f,rad,0);
                printf("La revedere...");
                fclose(f);
                printf("%s",rad->date->nume);
                return 0;
            }
            case 7:
                {
                printf("\n Intoduceti medicamentul pe care doriti sa il adaugati:");
                scanf("%s",&c);

                adaugare(info(c));
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
