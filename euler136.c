#include <stdio.h>

#define M 50000000

char s[M];

int main()
{
    int k, x, n, i;
    for (k=1;; k++) {
        n = (k<<2)-1;
        if (n>M) break;
        for (x=n-2, i=1; i<=(k<<1); i++, n+=x, x-=2) {
            if (n>M) break;
            if (s[n]<2) {
                if (i>k && i<(k<<1)) s[n]++;
                s[n]++;
            }
        }
    }

    n = 0;
    for (k=1; k<M; k++) {
        if (s[k]==1) n++;
    }
    printf("%d\n", n);
    return 0;
}
