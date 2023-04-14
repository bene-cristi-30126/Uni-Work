#include <stdio.h>
#include <stdlib.h>
#define NMAX 50


int v[NMAX], k;

void citire(int *n, int a[100][100])
{
    FILE *f=fopen ("graf.TXT","r");//citirea din fisier
    if(f == NULL)
    {
        printf("Eroare la deschiderea fisierului");
        exit(0);
    }


    int i,j,m,c;
    fscanf(f,"%d",n);//numar de varfuri
    fscanf(f,"%d",&m);//numar de muchii

    for(int i=1; i<=*n; i++)     //initializarea matricei de adiacenta cu 0
    {
        for(int j=1; j<=*n; j++)
        {
            a[i][j]=0;
        }
    }
    int p, z;
    for(c=1; c<=m; c++) //completarea matricei cu valori de 1 unde intre 2 noduri exista muchie
    {
        fscanf(f,"%d",&p);
        fscanf(f,"%d",&z);
        a[p][z]=1;//avem arc de la i la j
        a[z][p]=1;
    }
    fclose(f);//inchidem fisierul
}



void afisare_mat(int *n, int a[100][100])
{
    int i,j;
    for(i=1;i<=*n;i++)
    {
        for(j=1;j<=*n;j++){
           printf("%d ",a[i][j]);
        }
        printf("\n");
    }
}

void verificare_lant(int a[100][100])
{
     //verificare daca este lant

    printf("Dati numarul de noduri:");
    scanf("%d",&k);
    for(int i=0;i<k;i++){
        printf("v[%d]=",i);
        scanf("%d",&v[i]);
        }
    int lant=1;
    for(int i=0;i<k-1;i++)
    {
       if(a[v[i]][v[i+1]] !=1)
        {
            lant=0;
            break;
        }

    }
    if(lant==1)
    {
        printf("\nSuccesiunea data este lant in graf");
    }
    else
    {
        printf("\nSuccesiunea data nu este lant in graf");
    }
}

int main()
{
    int a[100][100],n;
    citire(&n,a);
    afisare_mat(&n,a);
    verificare_lant(a);
    return 0;

}
