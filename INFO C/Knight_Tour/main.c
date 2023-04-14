#include <stdio.h>
#include <conio.h>
#include <string.h>

int N;
int nr_solutie=1;

int linie[] = { 2, 1, -1, -2, -2, -1, 1, 2, 2 };
int coloana[] = { 1, 2, 2, 1, -1, -2, -2, -1, 1 };

int validare(int x, int y)
{
    if (x < 0 || y < 0 || x >= N || y >= N) {
        return 0;
    }

    return 1;
}


void Solutie(int vizitat[N][N], int x, int y, int pos)
{

    vizitat[x][y] = pos;

    if (pos >= N*N)
    {
        printf("Solutia nr:%d\n",nr_solutie++);
        for (int i = 0; i < N; i++)
        {
            for (int j = 0; j < N; j++) {
                printf(" %d ",vizitat[i][j]);
            }
            printf("\n");
        }
        printf("\n");
        getch();
        vizitat[x][y] = 0;
        return;
    }


    for (int k = 0; k < 8; k++)
    {

        int X_urm = x + linie[k];
        int Y_urm = y + coloana[k];


        if (validare(X_urm, Y_urm) && !vizitat[X_urm][Y_urm])
        {
            Solutie(vizitat, X_urm, Y_urm, pos + 1);
        }
    }

    vizitat[x][y] = 0;
}

int main()
{
    printf("Introduceti dimensiunea tablei de sah = ");
    scanf("%d",&N);
    printf("\n");
    int vizitat[N][N];

   for (int x = 0; x < N; x++)
        for (int y = 0; y < N; y++)
            vizitat[x][y] =0;

    int pos = 1;

    Solutie(vizitat, 0, 0, pos);

    return 0;
}
