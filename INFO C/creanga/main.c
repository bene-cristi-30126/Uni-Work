#include <stdio.h>
#include <stdlib.h>

int n, greutate_mere[10], inaltime_mere[10];


void citire_din_fisier()
{
    FILE *f=fopen ("pom.txt","r");
    if(f == NULL)
    {
        printf("NU s-a deschis fisierul pom.txt...");
        exit(1);
    }
    fscanf(f, "%d", &n);
    for(int i=0; i<n; i++)
        fscanf(f, " %d %d \n", &greutate_mere[i], &inaltime_mere[i]);

    fclose(f);
}

void rusac(int G, int masa[], int cost[], int n)
{
   int masa_dispoibila;
    float valoare_totala;
    int i, material;
    int vizitate[10];

    for (i = 0; i < n; ++i)
        vizitate[i] = 0;

    masa_dispoibila = G;
    while (masa_dispoibila > 0)
    {

        material = -1;
        for (i = 0; i < n; ++i)
            if ((vizitate[i] == 0) && ((material == -1) || ((float)cost[i]/masa[i] > (float)cost[material]/masa[material])))
                material = i;

        vizitate[material] = 1;
        masa_dispoibila -= masa[material];
        valoare_totala += cost[material];
        if (masa_dispoibila >= 0)
            printf("Marul %d (%d de g, a ridicat creanga %d cm) a fost adaugat. Spatiu de cules ramas: %d.\n", material + 1, cost[material], masa[material], masa_dispoibila);
    }

    printf("Valoarea totala din rusac este: %.2f de g.\n", valoare_totala);
}

int inaltime(int inaltime_pom, int mere[n])
{
    for(int i=0; i<n; i++)
    {
        inaltime_pom = inaltime_pom + mere[i];
    }
    return inaltime_pom;
}

int main()
{
    int inaltime_om, inaltime_pom=50;

    printf("Introduceti inaltimea culegatorului\n");
    scanf("%d", &inaltime_om);

    citire_din_fisier();

    for(int i=0; i<n; i++)
    {
        inaltime_mere[i]=inaltime_mere[i] - 50;  //extragem tulpina din inaltimea marului
    }

    inaltime_pom = inaltime(inaltime_pom,inaltime_mere);  //calculam inaltimea pomului plin de mere

    rusac(inaltime_om-inaltime_pom, inaltime_mere, greutate_mere, n);


    return 0;
}
