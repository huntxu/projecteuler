#include <stdio.h>

inline int max(int a, int b, int c)
{
    return a>b?(a>c?a:c):(b>c?b:c);
}

int main()
{
    int i, j, m, n;
    int a, b, c, s, t;
    int h=5000;
    for (i=0; i<=50; i++) {
        for (j=1; j<=50; j++) {
            for (m=i+1; m<=50; m++) {
                for (n=0; n<=j-1; n++) {
                    a = i*i+j*j;
                    b = m*m+n*n;
                    c = (i-m)*(i-m) + (j-n)*(j-n);
                    s = a+b+c;
                    t = max(a, b, c);
                    if ((t<<1) == s) {
                        h++;
                    }
                }
            }
        }
    }
    printf("%d\n", h);
}
