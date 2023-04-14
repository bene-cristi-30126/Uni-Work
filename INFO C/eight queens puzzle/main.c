#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#define NMAX 10

    int n; /* dimensiunea (ordinul) tablei de șah */
    int nr_solutie;
    int x[NMAX];


int FI(int k)
{ /* testează condițiile de continuare */
         int i;
         for(i = 1; i <= k-1; i++)
         if((x[k] == x[i]) || (abs(k - i) == abs(x[k] - x[i])))
         return 0;
         return 1;
}

void back_recursiv(int k)
{
     for(int j = 1; j <= n; j++)
     {
         x[k]=j;
         if(FI(k) == 1)
            if(k < n) back_recursiv(k+1);
         else
         { /* tipărirea soluției */
             nr_solutie++;
             printf("\nSOLUTIA nr.%d\n", nr_solutie);
             for(int i = 1; i <= n; i++)
             {
                 for(int p = 1; p <= n; p++)
                    if(x[i] == p) printf(" 1 ");
                    else printf(" 0 ");
                 printf("\n");
            }
            getch();
         }
     }
}

void dame_nerecursiv(int n)
{
     int x[NMAX], v, i, j, k = 1, nr_solutie = 0;
     x[k]=0;
     while(k > 0)
     { /* găsirea unei așezări corecte în linia k */
         v=0;
         while((v == 0) && (x[k] <= n-1))
         {
             x[k]++;
             v=1;
             i=1;
             while((i <= k-1) && (v == 1))
             if((x[k] == x[i]) || (abs(k-i) == abs(x[k] - x[i]))) v=0;
             else i++;
         }

         if(v == 0) k--;
         else
         {
             if(k == n)
             { /* afișarea tablei */
                 nr_solutie++;
                 printf("\nSOLUTIA nr. %d\n",nr_solutie);
                 for(i = 1; i <= n; i++)
                 {
                     for(j = 1; j <= n; j++)
                         if (x[i] == j) printf(" 1 ");
                         else printf(" 0 ");
                     printf("\n");
                 }
                 getch();
             }
            else
            {
                k++;
                x[k] = 0;
            }
         }
     }
}

int main()
{
  printf("\nRezolvare recursiva\n");

 printf("\nOrdinul tablei de sah n=");
 scanf("%d",&n);
 back_recursiv(1);

 printf("\nRezolvare nerecursiva\n");

 int n;
 printf("\nOrdinul tablei de sah=");
 scanf("%d",&n);
 dame_nerecursiv(n);

 return 0;
}

