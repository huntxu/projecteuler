#include <stdio.h>
#include <stdint.h>

#define N 100

uint64_t t=0;
uint64_t a[10][N+1];

int main()
{
    int i, j;
    for (i=1; i<=9; i++) {
        for (j=1; j<=N; j++) {
            a[i][j] = (i>1 && j>1)?a[i-1][j]+a[i][j-1]:1;
            t += 2*a[i][j];
            t += (N-j)*a[i][j];
        }
        t -= N;
    }
    printf("%llu\n", t);
    return 0;
}
