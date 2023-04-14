#include <stdio.h>
#include <stdlib.h>

typedef struct locomotive
{
    int Id;
    char Tip[20];
    float masa;
} locomotive;

locomotive a[100];
int i;

void intrare(int i)
{
    printf("Introduceti: Id-ul Tip-ul si masa locomotivei: ");
    scanf("%d %s %f", &a[i].Id, &a[i].Tip, &a[i].masa);
}

void afisare(int i)
{
    for(int c=1; c<=i; c++)
    {
        printf("%d %s %f\n", a[c].Id, a[c].Tip, a[c].masa);
    }
}

void iesire(int j)
{
    printf("Iese locomotiva %d %s %f\n", a[1].Id, a[1].Tip, a[1].masa);
}

int main()
{
    printf("\n1 - Intrare,\n2 - Iesire, \n3 - Afisare \n4 - Terminare\n");
    int optiune = -1;
    int j=1;
    while(optiune !=0)
    {
        scanf("%d", &optiune);
        switch(optiune)
        {
        case 1:
            {
                intrare(j);
                j++;
            }
            break;
        case 2:
            if(j==0)
                printf("DEpozitul este gol\n");
            else
            {
                iesire(j);
                for(int n=1; n<=j-1 ;n++)
                {
                    a[n].Id=a[n+1].Id;
                    strncpy(a[n-1].Tip, a[n].Tip, 20);
                    a[n].masa=a[n+1].masa;
                }
                j--;
            }
            break;

        case 3:
                if(j==0)
                printf("DEpozitul este gol\n");
                else
                    afisare(j-1);
            break;

        case 4:
            return 0;

        default:
            printf("Eroare!\n");
            break;
        }
    }
    return 0;
}
