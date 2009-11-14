#include <stdio.h>

int f[101][101];

int main()
{
    int i, j, s, t;
    for (i=0; i<=100; i++) {
        f[1][i] = 1;
    }
    for (i=2; i<=100; i++) {
       f[i][0] = 1;
    }
    for (i=2; i<=100; i++) {
        for (j=1; j<=100; j++) {
            s = 0;
            t = j;
            while (t>=0) {
                s += f[i-1][t];
                t -= i;
            }
            f[i][j] = s;
        }
    }
    printf("%d\n", f[99][100]);
    return 0;
}
