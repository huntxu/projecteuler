#include <stdio.h>

int coins[9] = {0, 1, 2, 5, 10, 20, 50, 100, 200};
int f[9][201];

int main()
{
    int i, j, s, t;
    for (i=0; i<=200; i++) {
        f[0][i] = 1;
        f[1][i] = 1;
    }
    for (i=2; i<=8; i++) {
        f[i][0] = 1;
    }
    for (i=2; i<=8; i++) {
        for (j=1; j<=200; j++) {
            s = 0;
            t = j;
            while (t>=0) {
                s += f[i-1][t];
                t -= coins[i];
            }
            f[i][j] = s;
        }
    }
    printf("%d\n", f[8][200]);
    return 0;
}
