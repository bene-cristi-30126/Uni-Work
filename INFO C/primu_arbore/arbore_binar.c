#include <stdio.h>
#include <stdlib.h>

typedef struct tip_nod
{
        char c;
        struct tip_nod *st, *dr;
} TIP_NOD;

TIP_NOD *construire_echilibrat(int nr_noduri)
{
TIP_NOD *p = NULL;
int n_st, n_dr;
if(nr_noduri != 0)
{
n_st = nr_noduri/2;
n_dr = nr_noduri - n_st - 1;
p = (TIP_NOD *)malloc(sizeof(TIP_NOD));
scanf("%c", &(p->c));
p->st = construire_echilibrat(n_st);
p->dr = construire_echilibrat(n_dr);
}
return p;
}

void preordine(TIP_NOD *p, int nivel)
{
int i;
if (p != 0)
{

for(i = 0; i <= nivel; i++) printf(" ");
printf("%c\n", p->c);
preordine(p->st, nivel+1);
preordine(p->dr, nivel+1);
}
}

int main()
{
    TIP_NOD *radacina;
    int nr_noduri;
    printf("Introduceti numar de noduri ");
    scanf("%d", &nr_noduri);
    printf("\nIntroduceti informatia din nod in preordine ");
    radacina = construire_echilibrat(nr_noduri+1);
    preordine(radacina, 0);
    return 0;
}
