#include <stdio.h>
#include <stdlib.h>

typedef struct locomotiva
{
int Id;
char Tip[21];
float Greutate;
struct locomotiva *urm;
} LOCOMOTIVA;

void Intrare(LOCOMOTIVA **prim, LOCOMOTIVA **ultim);
void Iesire(LOCOMOTIVA **prim, LOCOMOTIVA **ultim);
void Afisare(LOCOMOTIVA *prim);

int main()
{

    int optiune;
    LOCOMOTIVA *prim = 0, *ultim = 0;
    printf("1 Intrare, 2 Iesire, 3 Afisare, 4 Terminare\n");
    while(1)
    {
        scanf("%d", &optiune);
    switch(optiune)
    {
        case 1:
        {
            Intrare(&prim, &ultim);
            break;
        }
        case 2:

        {
            Iesire(&prim, &ultim);
            break;
        }

        case 3:
        {
            if(prim == 0)
            {
            printf("Depoul este gol...\n");
            }
            else
            {
            Afisare(prim);
            }
            break;
        }

        case 4:
        {
            printf("La revedere...");
            return 0;
        }
        default:
        {
            printf("Optiune gresita...");
        break;
        }
    }
    }
    return 0;
}

void Intrare(LOCOMOTIVA **prim, LOCOMOTIVA **ultim)
{
    LOCOMOTIVA * p = (LOCOMOTIVA *)malloc(sizeof(LOCOMOTIVA));

    printf("Introduceti Id = ");
    scanf("%d", &p->Id);

    printf("Introduceti Tip = ");
    scanf("%s", p->Tip);

    printf("Introduceti Greutate = ");
    scanf("%f", &p->Greutate);

    if (* prim == 0)
    {
        (*prim) = (*ultim) = p;
    }
    else
    { /* se adaugă după ultimul nod */
        (*ultim)->urm = p;
        (*ultim) = p;
}
}

void Iesire(LOCOMOTIVA **prim, LOCOMOTIVA **ultim)
{
    LOCOMOTIVA *p;
    if(*prim != NULL)
    {
        p = *prim;
        printf("Locomotiva care iese are urmatoarele detalii: Id = %d Tip = %s Greutate= %f\n", p->Id, p->Tip, p->Greutate);
        *prim = (*prim)->urm;
        free(p); /* eliberarea spațiului de memorie */
        if(*prim == NULL)
        {
            *ultim = NULL; /* lista a devenit vidă */
        }
    }
}

void Afisare(LOCOMOTIVA *prim)
{
    LOCOMOTIVA *p = prim;
    int i = 0;
    while(p)
    {
        i++;
        printf("Locomotiva %d are urmatoarele detalii: Id = %d Tip = %s Greutate =%f\n", i, p->Id, p->Tip, p->Greutate);
        p = p->urm;
    }
}

