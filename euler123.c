#include <stdio.h>
#include <stdint.h>
char prime[500000];
int64_t i,j;
int64_t num = 0;
int64_t t = 5000000000;
int main()
{
    for (i=2; i<=500000; i++) {
        if (prime[i]==0) {
            num++;
            for (j=i; j<=500000; j+=i) {
                prime[j] = 1;
            }
            if (i*num > t && num%2) {
                printf("%ld\n", num);
                break;
            }
        }
    }
    return 0;
}
