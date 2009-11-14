#include <stdio.h>

char primes[1000001];

int next(int t)
{
    t++;
    while (t++) {
        if (primes[t]==0) break;
    }
    return t;
}

int main()
{
    int i=2, j, k=1000000, s, l;
    int big=0, len=0;
    while (i++<=k) {
        if (primes[i]==0) {
            for (j=2*i; j<=k; j+=i) {
                primes[j] = 1;
            }
        }
    }
    for (i=2; i<=k; i++) {
        if (primes[i]==0) {
            s = i;
            l = 1;
            j = i;
            while (s < k) {
                j = next(j);
                s += j;
                if (s>=k) break;
                l ++;
                if (primes[s]==0) {
                    if (l>len) {
                        len = l;
                        big = s;
                    }
                    if (l==len && s>big) {
                        big = s;
                    }
                }
            }
        }
    }
    printf("%d\n", big);
    return 0;
}

