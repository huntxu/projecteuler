#include <stdio.h>

int k=10000000;
int t[10000001];
int sum=0;
int main()
{
    int i, j;
    for (i=2; i<=5000000; i++) {
        for (j=(i<<1); j<=k; j+=i) {
            t[j]++;
        }
    }
    for (i=2; i<k; i++) {
        if (t[i]==t[i+1]) {
            sum++;
        }
    }
    printf("%d\n", sum);
    return 0;
}
