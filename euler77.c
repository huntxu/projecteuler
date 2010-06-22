#include <stdio.h>

#define N 1000

char is_prime[N+1];
int ways[N+1];

int main()
{
    int i, j, found=0, last_p=2;
    for (i=2; i<=N; i++) {
        if (is_prime[i]==0) {
            ways[i]++;
            for (j=(i<<1); j<=N; j+=i) {
                is_prime[j]=1;
            }
            for (j=last_p+2; j<i+2; j++) {
                if (ways[j]>5000) {
                    printf("%d\n", j);
                    found = 1;
                    break;
                }
            }
            if (found) break;
            for (j=2; i+j<=N; j++) {
                ways[j+i] += ways[j];
            }
            last_p=i;
        }
    }
    return 0;
}
