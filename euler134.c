#include <stdio.h>
#include <stdint.h>

char primes[1000101];

int exgcd(int a, int b, int64_t *x, int64_t *y)
{
    if (b == 0) {
        *x = 1;
        *y = 0;
        return a;
    }
    int r = exgcd(b, a % b, x, y);
    int64_t t = *x;
    *x = *y;
    *y = t - a / b * *y;
    return r;
}

int main()
{
    int i, j;
    int m, t, p;
    int64_t x, y;
    uint64_t s=0;
    for (i=2; i<=5; i++) {
        if (primes[i]==0) {
            for (j=i<<1; j<=1000100; j+=i) {
                primes[j]=1;
            }
        }
    }
    m = 5;
    for (i=7; i<=1000100; i++) {
        if (primes[i]==0) {
            for (j=i<<1; j<=1000100; j+=i) {
                primes[j]=1;
            }
            t = 10;
            while (m>t) t*=10;
            p = t%i;
            exgcd(p, i, &x, &y);
            x *= i-m;
            while (x<=0) x+=i;
            x %= i;
            s+=x*t+m;
            m = i;
            if (m>1000000) {
                i = 9999999;
            }
        }
    }
    printf("%llu\n", s);
    return 0;
}

