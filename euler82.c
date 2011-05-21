#include <stdio.h>

#define RC 80

int matrix[RC][RC];
int ms[RC][RC];
int min=19881101;

void comput_ms(int m, int n)
{
    int t = ms[m][n+1];
    int i, k;
    for (i=m-1, k=0; i>=0; i--) {
        k += matrix[i][n];
        if (k>=t) break;
        if (k+ms[i][n+1]<t) {
            t = k+ms[i][n+1];
        }
    }
    for (i=m+1, k=0; i<RC; i++) {
        k += matrix[i][n];
        if (k>=t) break;
        if (k+ms[i][n+1]<t) {
            t = k+ms[i][n+1];
        }
    }
    ms[m][n] = matrix[m][n]+t;
    if (n==0 && ms[m][n]<min) {
        min = ms[m][n];
    }
    return;
}

int main()
{
    int i, j;
    for (i=0; i<=RC-1; i++) {
        for (j=0; j<RC-1; j++) {
            scanf("%d,", &matrix[i][j]);
        }
        scanf("%d\n", &matrix[i][j]);
        ms[i][j] = matrix[i][j];
    }
    for (j=RC-2; j>=0; j--) {
        for (i=RC-1; i>=0; i--) {
            comput_ms(i, j);
        }
    }
    printf("%d\n", min);
    return 0;
}
