#include <stdio.h>

#define MAX 1500000

int l[MAX+1];

int gcd(int m, int n)
{
    while (m!=0) {
        n %= m;
        if (n==0) {
            return m;
        }
        m %= n;
    }
    return n;
}

int main()
{
    int x=1, y, i, t;
    for (x=1; x<=612; x++) {
        /* let x=y, perimeter l=(y^2+x^2)+(y^2-x^2)+2xy=4x^2, (int)(sqrt(1500000/4))=612 */
        y=x;
        while (y++) {
            if (gcd(x, y)==1 && (y-x)&1) {
                t = 2*y*y+2*x*y;
                if (t>MAX) {
                    break;
                }
                else {
                    for (i=t; i<=MAX; i+=t) {
                        l[i]++;
                    }
                }
            }
        }
    }
    t = 0;
    for (i=1; i<=MAX; i++) {
        if (l[i]==1) {
            t ++;
        }
    }
    printf("%d\n", t);
    return 0;
}
