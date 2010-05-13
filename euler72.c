#include <stdio.h>
#define MAX 1000001

int phi[MAX];
int pr[MAX];
int i, j;
unsigned long long sum=0;

int main()
{
    pr[0]=0;

    for (i=2; i<MAX; i++) {
        if (!phi[i]) {
            pr[++pr[0]]=i;
            phi[i]=i-1;
        }

        for(j=1; j<=pr[0] && pr[j]*i<MAX; j++) {
            if(i%pr[j]==0) {
                phi[i*pr[j]] = phi[i] * pr[j];
                break;
            }
            else phi[i*pr[j]]=phi[i]*(pr[j]-1);
        }
        sum += phi[i];
    }
    printf("%llu\n", sum);
    return 0;
}
