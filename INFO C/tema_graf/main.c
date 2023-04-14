#include <stdlib.h>
#include <stdio.h>

typedef struct nod
{
    int cheie;
    struct nod *urm;
} NOD;

void adauga( NOD **prim, NOD **ultim,int cheie)
{
    NOD *p = (NOD*)malloc(sizeof(NOD));
    p->cheie = cheie;
    if (*prim==0)
    {
        p->urm = 0;
        *prim = *ultim = p;
    }
    else
    {
        p->urm = *prim;
        *prim = p;
    }
}

int sterge(NOD **prim, NOD **ultim)
{
    NOD *p;
    int cheie=0;
    if(*prim!=0)
    {
        p=*prim;
        *prim=(*prim)->urm;
        cheie = p->cheie;
        if(*prim==0)
        {
            *ultim=0;
        }
        free(p);
    }
    return cheie;
}

int ** citire(int *n)
{
    int **a;
    FILE *f=fopen ("graf.txt","r");
    if(f == NULL)
    {
        printf("NU s-a deschis fisierul graf.txt...");
        exit(1);
    }
    int i,j;
    fscanf(f,"%d",n);
    a = (int **)malloc((*n+1)*sizeof(int));
    for(i=1; i<=*n; i++)
    {
        *(a+i) = (int *)malloc((*n+1)*sizeof(int));
        {
            for(j=1; j<=*n; j++)
            {
                fscanf(f,"%d",&a[i][j]);
            }
        }
    }
    fclose(f);
    return a;
}

void explorare_adancime(int **a, int n, int s)
{
    int *vizitate = (int *)malloc((n+1)*sizeof(int));
    NOD *prim = 0, *ultim = 0;
    int i, v, w;
    for (i=1; i<=n; i++)
    {
        vizitate[i]=0;
    }
    adauga(&prim, &ultim, s);
    vizitate[s] = 1;
    printf("Explorarea in adancime din nodul %d este:\n", s);
    while (prim)
    {
        v = sterge(&prim, &ultim);
        printf("%d ", v);
        for (i=1; i<=n; i++)
        {
            if(a[v][i]==1 && vizitate[i]==0)
            {
                w = i;
                adauga(&prim, &ultim, w);
                vizitate[w] = 1;
                printf("->%d ", w);
            }
            else
                w = sterge(&prim, &ultim);
        }
    }
    printf("\n------------\n");
    free(vizitate);
}


void afisare(int **a, int n)
{
    int i, j;
    printf("Continutul matricei de adiacente:\n");
    for(i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            printf("%2d ", a[i][j]);
        }
        printf("\n");
    }
}

void afisare_traversari(int **a, int n)
{
    int s;
    for(s=1; s<=n; s++)
    {
        explorare_adancime(a, n, s);
    }
}
int main()
{
    int n, **a = citire(&n);
    afisare(a, n);
    afisare_traversari(a, n);
    return 0;
}
