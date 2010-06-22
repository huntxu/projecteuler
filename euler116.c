#include <stdio.h>
#include <stdint.h>

#define N 50

uint64_t matrix[(int)(N/2)+1][N+1];

void clean_matrix(int t)
{
    int i, j;
    for (i=1; i<=(int)(N/t); i++) {
        for (j=0; j<=N; j++) {
            matrix[i][j] = 0;
        }
    }
}

int main()
{
    int i, j, t;
    uint64_t s = 0;
    for (i=0; i<=N; i++) {
        matrix[0][i] = 1;
    }
    for (t=2; t<=4; t++) {
        clean_matrix(t);
        for (i=1; i<=(int)(N/t); i++) {
            for (j=t*i; j<=N; j++) {
                matrix[i][j] = matrix[i][j-1] + matrix[i-1][j-t];
            }
            s += matrix[i][N];
        }
    }
    printf("%llu\n", s);
    return 0;
}
