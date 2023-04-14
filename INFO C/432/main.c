#include <stdio.h>
#include <stdlib.h>

int arr[4][4]={{1,16,3,4},{5,2,7,8},{9,6,10,11},{13,14,15,12}};

int n = 4;

void schimba(int marime, int suprafata[][marime], int x1, int y1, int x2, int y2) {
  int temp = suprafata[x1][y1];
  suprafata[x1][y1] = suprafata[x2][y2];
  suprafata[x2][y2] = temp;
}

void afisare()
{
    for(int i=0; i<4; i++)
        {
             for(int j=0; j<4; j++)
                printf(" %d ",arr[i][j]);
            printf("\n");
        }
}

int cost(int arr[4][4])
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

int spatiu_gol(int arr[4][4])
{
    for(int i=0; i<4; i++){
        for(int j=0; j<4; j++)
        {
            if(arr[i][j]==16)
               return (i*4+j+1);
        }
    }
}

void mutare()
{
    int st, dr, sus, jos;
    int i = 0, j = 0;
    int cst = cost(arr);
    int cst2;
    while(cst > 0) {
        for(i = 0; i < 4; i++) {
            for(j = 0; j < 4; j++) {
                if(arr[i][j]==16) {
                    st = arr[i][j-1];
                    dr = arr[i][j+1];
                    sus = arr[i-1][j];
                    jos = arr[i+1][j];
                    if(st != i * 4 + j) {
                        schimba(4, arr, i, j-1, i, j);
                        cst2 = cost(arr);
                        if(cst2 < cst) {
                            cst = cst2;
                        }
                        else {
                            schimba(4, arr, i, j-1, i, j);
                        }
                    }
                    if(dr != i * 4 + j + 2) {
                        schimba(4, arr, i, j+1, i, j);
                        cst2 = cost(arr);
                        if(cst2 < cst) {
                            cst = cst2;
                        }
                        else {
                            schimba(4, arr, i, j+1, i, j);
                        }
                    }
                    if(sus != (i - 1) * 4 + j + 1) {
                        schimba(4, arr, i-1, j, i, j);
                        cst2 = cost(arr);
                        if(cst2 < cst) {
                            cst = cst2;
                        }
                        else {
                            schimba(4, arr, i-1, j, i, j);
                        }
                    }
                    if(jos != (i + 1) * 4 + j + 1) {
                        schimba(4, arr, i+1, j, i, j);
                        cst2 = cost(arr);
                        if(cst2 < cst) {
                            cst = cst2;
                        }
                        else {
                            schimba(4, arr, i+1, j, i, j);
                        }
                    }
                }
            }
        }
    }
}

int main()
{

    afisare();
    printf("\nCostul initial: %d\n", cost(arr));
    mutare();
    afisare();
    return 0;
}
