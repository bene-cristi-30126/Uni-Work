#include <stdio.h>
#include <conio.h>
#include<stdlib.h>

FILE *fis;
int a[50][50],n,m;
int viz2[50];

int ciclu[50];

void citire ()
{

    int i,j;
        fis=fopen("GRAF.TXT","r");
    if(fis==NULL)
    {
        printf("Nu exista fisierul");
        exit(1);
    }
    fscanf(fis,"%d%d",&n,&m);
    for(i=1;i<=m;i++)
    {
            fscanf(fis,"%d%d",&i,&j);
            a[i][j]=1;
    }
    fclose(fis);
}


 void DFS( int nod) //explorare in adancime
 {
     int i;
     viz2[nod]=1;
     printf("%d->",nod);
     for(i=1;i<=n;i++)
      if( (viz2[i]==0) && (a[nod][i]==1))
      {
          DFS(i);
          ciclu[i]=nod;

      }

 }

 int main()
 {
     citire();
     printf("\n");
     DFS(3);
         if(ciclu[1]=ciclu[m])
            printf("Exista ciclu");
         else
            printf("Nu exista ciclu");
     return 0;
 }
