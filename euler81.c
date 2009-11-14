#include <stdio.h>
#include <stdint.h>

uint32_t a[81][81];

int main()
{
    int i, j;
    for (i=1; i<=80; i++) {
        a[i][0] = ~a[i][0];
        a[0][i] = ~a[0][i];
    }
    a[0][1] = 0;
    for (i=1; i<=80; i++) {
        for (j=1; j<=80; j++) {
            scanf("%d", &a[i][j]);
            a[i][j] += a[i-1][j]>a[i][j-1]?a[i][j-1]:a[i-1][j];
            if (j==80) {
                scanf("\n");
            }
            else {
                scanf(",");
            }
        }
    }
    printf("%d\n", a[80][80]);
    return 0;
}
