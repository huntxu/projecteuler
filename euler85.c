#include <stdio.h>
#include <stdint.h>

int i=1;
int t=0;
uint64_t k;
int high=0;
int m, n;
int a[3000];
int main()
{
    while (t <= 2000000) {
        t += i++;
        a[i-2] = t;
    }
    for (i=0; i<2000; i++) {
        for (t=i; t<2000; t++) {
            k = a[i]*a[t];
            if (k <= 2000000) {
                if (k>high) {
                    high=k;
                    m = i+1;
                    n = t+1;
                }
            }
        }
    }
    printf("%d\n", m*n);
    return 0;
}
