#include <stdio.h>
#include <stdint.h>

#define A 1777
#define K 1855

inline unsigned int powermod(unsigned int a, unsigned int k, unsigned int m)
{
    uint64_t tmp = a;
    unsigned int ret=1;
    while (k) {
        if (k&1) ret=ret*tmp%m;
        tmp = tmp*tmp%m;
        k >>= 1;
    }
    return ret;
}

int main()
{
    int i;
    unsigned int k = 1;
    for (i=1; i<=K-1; i++) {
        k = powermod(A, k, 40000000);
    }
    k = powermod(A, k, 100000000);
    printf("%u\n", k);
    return 0;
}
