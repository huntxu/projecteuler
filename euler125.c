#include <stdio.h>
#include <string.h>
#include <stdint.h>

int a[10005];
char k[100000020];
char m[10];
char n[10];
uint64_t sum = 0;

int main()
{
    int i, s, j;
    for (i=1; i<=10000; i++) {
        a[i-1] = i*i;
    }
    for (i=0; i<10000; i++) {
        j = i+1;
        s = a[i]+a[j++];
        while (s<100000000) {
            k[s-1] = 1;
            s += a[j++];
        }
    }
    for (i=1; i<=100000000; i++) {
        if (k[i-1]) {
            if (i%10) {
                bzero(m ,10);
                bzero(n, 10);
                sprintf(m, "%d", i);
                s = strlen(m);
                for (j=0; j<s; j++) {
                    n[j] = m[s-j-1];
                }
                if (strncmp(m, n, s)==0) {
                    sum += i;
                }
            }
        }
    }
    printf("%llu\n", sum);
    return 0;
}
