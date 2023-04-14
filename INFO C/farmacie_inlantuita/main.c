#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    char *nume;
    char data_primiri[11], data_expirari[11];
    int cantitate;
    float pret;
} DATE_UTILE;

typedef struct nod
{
    DATE_UTILE *date_utile;
    struct nod *prec, *urm;
}NOD;

typedef struct
{
    NOD *prim, *ultim, *crt;
    int dimensiune;
} LISTA;

DATE_UTILE *Aloca_date(char *nume)
{
    DATE_UTILE *d = (DATE_UTILE *)malloc(sizeof(DATE_UTILE));
    d->nume = (char *)malloc((strlen(nume)+1)*sizeof(char));
    strcpy(d->nume, nume);
    return d;
}

NOD *Aloca_nod(DATE_UTILE *date_utile)
{
    NOD *nod = (NOD *)malloc(sizeof(NOD));
    nod->prec = nod->urm = NULL;
    nod->date_utile = date_utile;
    return nod;
}

void Adauga_ultim(LISTA *l, NOD *nod)
{
    l->dimensiune++;
    nod->prec = l->ultim;
    if(l->ultim != NULL)
    {
        l->ultim->urm = nod;
        l->ultim = nod;
    }
    else
    {
        l->prim = l->ultim = nod;
    }
}


void Creare(LISTA *l)
{
    FILE *f=fopen("medicamente.txt","r");
    if(f==NULL)
        exit(1);
    char buf[100];
    NOD *nod;
    DATE_UTILE *d;
    char *token=(char*)malloc(sizeof(char));
    l->dimensiune=0;
        while(fgets(buf,100,f))
        {

            token=strtok(buf,",");
            int i=0;
            d=Aloca_date(token);
            nod=Aloca_nod(d);

            while(token!=NULL)
            {
                switch(i)
                {
                    case 0:
                    {
                        strcpy(d->nume,token);
                        break;
                    }
                    case 1:
                    {
                        d->pret=atof(token);
                        break;
                    }
                    case 2:
                    {
                        d->cantitate=atoi(token);
                        break;
                    }
                    case 3:
                    {
                        strcpy(d->data_primiri,token);
                        break;
                    }
                    case 4:
                    {
                        strcpy(d->data_expirari,token);
                        break;
                    }
                }
                i++;
                token=strtok(NULL,",\n");
                Adauga_ultim(l,nod);
                nod=Aloca_nod(d);
        }
    }

    fclose(f);
}

void Afisare(LISTA *l)
{
        l->crt = l->prim;
            while(l->crt)
            {
            printf("%s\n", l->crt->date_utile->nume);
            l->crt = l->crt->urm;
            }
}


NOD *Cautare(LISTA *l,char *cuvant,float pret)
{
    NOD *q=(NOD*)malloc(sizeof(NOD));
    q = NULL;
    l->crt = l->prim;
    while( l->crt )
    {
        if (strcmp(l->crt->date_utile->nume,cuvant)==0 && l->crt->date_utile->pret==pret)
            {
                q=l->crt;
                break;
            }
            else
            {
                l->crt = l->crt->urm;
            }
    }
    return q;
}

NOD *Actualizare(LISTA *l,char *cuvant,float pret)
{
    l->crt = l->prim;
    printf("Introduceti noile date\n");
    int cantitate;
    char data_primiri[11];
    char data_expirari[11];
    scanf("%d %s %s", &cantitate, data_primiri, data_expirari);
    while( l->crt )
    {
        if (strcmp(l->crt->date_utile->nume,cuvant)==0 && l->crt->date_utile->pret==pret)
            {
                l->crt->date_utile->cantitate=cantitate;
                strcpy(l->crt->date_utile->data_primiri,data_primiri);
                strcpy(l->crt->date_utile->data_expirari,data_expirari);
                break;
            }
            else
            {
                l->crt = l->crt->urm;
            }
    }
    return l->crt;
}

void Eliminare(LISTA *l,NOD *q)
{
    if ((l->prim == q) && (l->ultim == q))
    {
        l->prim = l->ultim = 0;
        free(q);
    }
    else
    {
        if(q == l->prim)
        {
            l->prim = l->prim->urm;
            l->prim->prec = 0;
            free(q);
        }
        else
        {
            if (q == l->ultim)
            {
                l->ultim = l->ultim->prec;
                l->ultim->urm = 0;
                free(q);
            }
            else
            {
                q->urm->prec = q->prec;
                q->prec->urm = q->urm;
                free(q);
            }
            }
        }
}

void Salvare(LISTA *l)
{
    FILE *fp = fopen("output.txt", "w");
    if(!fp) return;
    l->crt = l->prim;

    while(l->crt)
    {

        if(l->crt->urm)
            fprintf(fp, "%s %f %d %s %s\n", l->crt->date_utile->nume, l->crt->date_utile->pret, l->crt->date_utile->cantitate, l->crt->date_utile->data_primiri, l->crt->date_utile->data_expirari);


        else
            {
                fprintf(fp, "%s %f %d %s %s", l->crt->date_utile->nume, l->crt->date_utile->pret, l->crt->date_utile->cantitate, l->crt->date_utile->data_primiri, l->crt->date_utile->data_expirari);
            }
            l->crt = l->crt->urm;
    }
    fclose(fp);
}


int main()
{
    printf("1 Cautare, 2 Eliminare, 3 Actualizare , 4 Afisare, 5 Terminare \n");
    LISTA *inventar=(LISTA *)malloc(sizeof(LISTA));
    inventar->prim = inventar->ultim = NULL;
    inventar->prim->prec=0;
    inventar->ultim->urm=0;
    int optiune;
    char *cuvant=(char*)malloc(sizeof(char));
    float pret;
    Creare(inventar);

    while(1)
    {
        scanf("%d", &optiune);
        switch(optiune)
        {
        case 1:
            {
                printf("Introduceti nume si pret ");
                scanf("%s %f", cuvant, &pret);
                NOD *a=Cautare(inventar,cuvant,pret);
                break;
            }
        case 2:
            {
                printf("Introduceti nume si pret ");
                scanf("%s %f", cuvant, &pret);
                NOD *q=Cautare(inventar,cuvant,pret);
                Eliminare(inventar,q);
                break;
            }
        case 3:
            {
                printf("Introduceti nume si pret ");
                scanf("%s %f", cuvant, &pret);
                NOD *q=Actualizare(inventar,cuvant,pret);
                break;
            }
        case 4:
            {
                 Afisare(inventar);
                 break;
            }
        case 5:
            {
                Salvare(inventar);
                return 0;
                printf("la revedere...");
            }
        default:
            {
                printf("ERoare");
                break;
            }
        }
    }



    free(inventar);
    free(cuvant);
    return 0;
}
