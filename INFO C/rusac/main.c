#include<stdio.h>

void fractional(int n, int cost[20], int masa[20], int G ) {
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
            printf("Obiectul %d (%d$, %dKg) a fost adaugat complet. Spatiu ramas: %d.\n", material + 1, cost[material], masa[material], masa_dispoibila);
        else {
            printf("Adaugat %d%% (%d$, %dKg) din obiectul %d in rusac.\n", (int)((1 + (float)masa_dispoibila/masa[material]) * 100), cost[material], masa[material], material + 1);
            valoare_totala -= cost[material];
            valoare_totala += (1 + (float)masa_dispoibila/masa[material]) * cost[material];
        }
    }

    printf("Valoarea totala din rusac este: %.2f$.\n", valoare_totala);
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
            printf("Obiectul %d (%d$, %dKg) a fost adaugat complet. Spatiu ramas: %d.\n", material + 1, cost[material], masa[material], masa_dispoibila);
    }

    printf("Valoarea totala din rusac este: %.2f$.\n", valoare_totala);
}
int main()
{
    int i, n, cost[20], masa[20], G;

    printf("Introduceti numarul de obiecte:");
    scanf("%d", &n);

    printf("introduceti costul si masa obiectului:\n");
    for(i = 0;i < n; ++i){
     scanf("%d%d", &cost[i], &masa[i]);
    }

    printf("Introduceti greutatea toala a ruscaului:");
    scanf("%d", &G);

    printf("\n---Luate in intregime---\n");
    rusac(G, masa, cost, n);

    printf("\n---Luate fractional---\n");
    fractional(n, cost, masa, G);
    return 0;
}
