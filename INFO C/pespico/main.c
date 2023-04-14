#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    int x,y;
}cordonate;

int arr[4][4]={
    {1,16,4,3},
    {5,2,7,8},
    {9,6,10,11},
    {13,14,15,12}};

void afisare()
{
    for(int i=0; i<4; i++)
        {
             for(int j=0; j<4; j++)
                printf(" %d ",arr[i][j]);
            printf("\n");
        }
}

int cost()
{
    int costul=0;
    for(int i=0; i<4; i++)
        for(int j=0; j<4; j++)
        {
            if(arr[i][j]!=(i*4+j+1))
            {
               costul++;
            }
        }
    return costul;
}

cordonate spatiu_gol()
{
    cordonate gol;
    for(int i=0; i<4; i++)
    {
        for(int j=0; j<4; j++)
        {
            if(arr[i][j]==16)
            {
                gol.x=i;
                gol.y=j;
            }
        }
    }
        return gol;
}

void schimba(int marime; int suprafata[][marime], int marime, int x1, int y1, int x2, int y2) {
  int temp = suprafata[x1][y1];
  suprafata[x1][y1] = suprafata[x2][y2];
  suprafata[x2][y2] = temp;
}

void mutare(int cost_initial)
{
    cordonate gol=spatiu_gol();
    if(arr[gol.x][gol.y]!=arr[3][3])
    {
        schimba(arr,4,gol.x,gol.y,(gol.x+1),gol.y);  int cost_jos=cost();
        if(cost_jos<cost_initial) mutare(cost_jos);
        else schimba(arr,4, (gol.x+1), gol.y, gol.x, gol.y);

        schimba(arr,4, gol.x, gol.y, gol.x,(gol.y+1));  int cost_dreapta=cost();
        if(cost_dreapta<cost_initial) mutare(cost_dreapta);
        else schimba(arr,4, gol.x,(gol.y+1), gol.x, gol.y);

        schimba(arr,4, gol.x, gol.y,(gol.x-1), gol.y);  int cost_sus=cost();
        if(cost_sus<cost_initial) mutare(cost_sus);
        else schimba(arr,4,(gol.x-1), gol.y, gol.x, gol.y);

        schimba(arr,4, gol.x, gol.y, gol.x, (gol.y-1));  int cost_stanga=cost();
        if(cost_stanga<cost_initial) mutare(cost_stanga);
        else schimba(arr,4, gol.x, (gol.y-1), gol.x, gol.y);
    }
    if(arr[gol.x][gol.y]==arr[3][3])
    {
        afisare();
        exit(1);
    }
}

int main()
{

    afisare();
    int cost_initial=cost();
    printf("REZOLVAT\n\n");
    mutare(cost_initial);

    return 0;
}
