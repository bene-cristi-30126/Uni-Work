#include <stdio.h>
#include <stdlib.h>
#define MAX 10

typedef struct tip_nod
{
        int cod;
        int nr_fii;
        struct tip_nod *adr_fii[MAX];
} TIP_NOD;

typedef struct nod_lista
{
    TIP_NOD *ptr;
    struct nod_lista *urm;
}NOD_LISTA;

TIP_NOD *radacina;
NOD_LISTA *prim,*ultim;

int push(TIP_NOD *p)
{
    NOD_LISTA * q = (NOD_LISTA *)malloc(sizeof(NOD_LISTA));
    if(q==NULL)
    {
        printf("\n Eroare la alocare spatiu la nodul stivei");
        return 0;
    }
    else
    {
        q->ptr=p;
        q->urm=prim;
        prim=q;
        return 1;
    }
}

TIP_NOD *pop()
{
    TIP_NOD *p;
    NOD_LISTA *q;
    if(prim == 0)
    {
        return 0;
    }
    else
    {
        q = prim;
        prim = prim->urm;
        if(prim==0)
        {
            ultim=0;
        }
        p = q->ptr;
        free(q);
        return p;
    }
}

int adaug(TIP_NOD *p)
{
    NOD_LISTA *q=(NOD_LISTA*)malloc(sizeof(NOD_LISTA));
    if(q==NULL)
    {
        printf("\n Eroare la alocare spatiu la nodul cozi");
        return 0;
    }
    q->ptr=p;
    q->urm=0;
    if(prim==0)
    {
        prim=q;
        ultim=q;
    }
    else
    {
        ultim->urm=q;
        ultim=q;
    }
    return 1;
}

TIP_NOD *elimin()
{
    TIP_NOD *p;
    NOD_LISTA *q;
    if(prim==0) return 0;
    else
    {
        q=prim;
        prim=prim->urm;
        p=q->ptr;
        free(q);
        return p;
    }
}

TIP_NOD *construire_oarecare()
{
    TIP_NOD *p = NULL;
    int n, i;
    printf("\nIntroduceti nr. total de noduri ");
    scanf("%d", &n);
    prim=0;
    while(n>0)
    {
        p=(TIP_NOD *)malloc(sizeof(TIP_NOD));
        if(p==NULL)
        {
            printf("\n NU s-a alocat meomrie");
            return p;
        }
        printf("\n Codul nodului= ");
        scanf("%d", &p->cod);
        printf("\n Numarul de fii= ");
        scanf("%d", &p->nr_fii);
        i=p->nr_fii;
        while(i>0)
        {
            if(p->adr_fii[i]==NULL)
            {
                printf("\n Eroare de introducere");
                return NULL;
            }
            i--;
        }
        if(push(p)==NULL)
        {
            printf("\n Eroare la adaugare pe stiva");
            return NULL;
        }
        n--;
    }
    return pop();
}

int traversare(TIP_NOD *rad)
{
    TIP_NOD *p;
    int i;
    prim=ultim=NULL;
    if(adaug(rad)==0) return 0;
    do
    {
        p=elimin();
        if(p !=NULL)
        {
            printf("Codul nodului= %d\n", p->cod);
            for(i=1;i<=p->nr_fii;i++)
            {
                if(adaug(p->adr_fii[i])== NULL) return 0;
            }
        }
    }while(p!=NULL);
    return 1;
}


int main()
{
        radacina = construire_oarecare();
        traversare(radacina);
    return 0;
}
