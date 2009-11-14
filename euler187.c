#include <stdio.h>

char a[50000001];
int b[50000001];
int k=100000000;
int main()
{
    int l = k/2;
    int i, j;
    int t=0, s=0;
    for (i=2; i<=l; i++) {
        if (a[i]==0) {
            t++;
            for (j=i<<1; j<=l; j+=i) {
                a[j]=1;
            }
        }
        b[i] = t;
    }
    i = 1;
    while (i++) {
        if (a[i]==0) {
            t = (int)(k/i);
            if (i>t) break;
            s += b[t]-b[i]+1;
        }
    }
    printf("%d\n", s);
    return 0;
}
