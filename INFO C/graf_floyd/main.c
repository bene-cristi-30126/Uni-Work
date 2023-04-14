#include <stdio.h>
#include <stdlib.h>
#define INFINIT 500
#define NMAX 100
int  A[NMAX][NMAX], C[NMAX][NMAX], P[NMAX][NMAX];

int ** citire(int *n)
{
    int **cost;
    FILE *f=fopen ("graf.txt","r");
    if(f == NULL)
    {
        printf("NU s-a deschis fisierul graf.txt...");
        exit(1);
    }
    int i, j, c;
    fscanf(f,"%d",n);
    cost = (int **)malloc((*n+1)*sizeof(int*));
    for(i=1; i<=*n; i++)
    {
        *(cost+i) = (int *)malloc((*n+1)*sizeof(int));
        for(j=1; j<=*n; j++)
        {
            C[i][j] = cost[i][j] = INFINIT;
        }
    }
    while(!feof(f))
    {
        i = j = 0;
        fscanf(f,"%d %d %d", &i, &j, &c);
        if(i>0 && i<=*n && j>0 && j<=*n)
        {
            C[i][j] = cost[i][j] = c;
            C[j][i] = cost[j][i] = c;
        }
    }
    fclose(f);
    return cost;
}

void afisare(int **cost, int n)
{
    int i, j;
    printf("Continutul matricei de costuri:\n");
    for(i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            if(cost[i][j] != INFINIT)
            {
                printf("%3d ", cost[i][j]);
            }
            else
            {
                printf("INF ");
            }
        }
        printf("\n");
    }
}

int citire_nod(int n, char *mesaj)
{
    int nod;
    do
    {
        printf("Introduceti nodul de %s = ", mesaj);
        scanf("%d", &nod);
    } while(nod<=0 || nod>n); /* nodul trebuie să aibă valoarea între 1 și n */
    return nod;
}

void FLOYD(int n)
{
    int i, j, k;
    for (i = 1; i <= n; i++)
    {
        for (j = 1; j <= n; j++)
        {
            A[i][j] = C[i][j]; // iniţializare A
            P[i][j] = 0;
        }
    }

    for (i = 1; i <= n; i++) A[i][i]=0;

    for (k = 1; k <= n; k++)// iteraţiile
    {
        for (i = 1; i <= n; i++)
        {
            for (j = 1; j <= n; j++)
            {
                if (A[i][k] + A[k][j] < A[i][j])
                {
                    A[i][j] = A[i][k] + A[k][j];
                    P[i][j] = k;
                }
            }
        }
    }
}

void cale(int i, int j)
{
    int k;
    k = P[i][j];
    if (k)
    {
        cale(i, k);
        printf("%d ",k);
        cale(k, j);
    }
}

void afisare_distante(int n, int s)
{
    int i, d;
    char raspuns;

    printf("\n");
    do
    {
        d = citire_nod(n, "sosire");
        printf("Drumul intre noduri este urmatorul: ");
        printf("%d ", s);
        cale(s, d);
        printf("%d\n", d);
        printf("Doriti sa continuati? ");
        scanf(" %c", &raspuns);
    } while(raspuns=='d' || raspuns=='D');
}

void afisare_Floyd(int n)
{
    printf ("Continutul matricea de distante minime\n");
    for (int i = 1; i < n; i++)
    {
        for (int j = 1; j < n; j++)
        {
            if(A[i][j] == INFINIT)
                printf("INF ");
            else
                printf("%3d ", A[i][j]);
        }
        printf("\n");
    }
}

int main()
{
    int n, **cost = citire(&n);
    afisare(cost, n);
    int s = citire_nod(n, "plecare");
    FLOYD(n);
    afisare_distante(n, s);
    afisare_Floyd(n);
    return 0;
}
