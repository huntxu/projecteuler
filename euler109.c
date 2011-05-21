#include <stdio.h>

int c[99]={0};
int ans = 21;

int main()
{
    int i, j, k;
    for (i=1; i<=20; i++) {
        c[i]++;
        c[i*2]++;
        c[i*3]++;
    }
    c[25]++;
    c[50]++;
    for (i=1; i<98; i++) {
        k=0;
        for (j=1; j<=(int)(i/2); j++) {
            k += c[j]*c[i-j];
            if (i-j==j) {
                k -= c[j]*(c[j]-1)/2;
            }
        }
        if (i<50) {
            ans += (k+c[i])*21;
        }
        else {
            j = (int)((99-i)/2);
            ans += (k+c[i])*(j>20?20:j);
        }
    }
    printf("%d\n", ans);
    return 0;
}
