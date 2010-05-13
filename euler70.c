/* with -O3 -ffast-math */
#include <stdio.h>
#define MAX 10000000

int phi[MAX];
int pr[MAX];
int i, j, x, y, a, b;
double n=1.10014;

int main()
{
    pr[0]=0;

    for (i=2; i<MAX; i++) {
        if (!phi[i]) {
            pr[++pr[0]]=i;
            phi[i]=i-1;
        }
        else {
            for(x=0, a=phi[i]; a>0; a/=10) x+=(1<<((a%10)*3));
            for(y=0, b=i; b>0; b/=10) y+=(1<<((b%10)*3));

            if(x==y && n*phi[i]>i) {
                phi[0]=i;
                n = (double)i/phi[i];
            }
        }

        for(j=1; j<=pr[0] && pr[j]*i<MAX; j++) {
            if(i%pr[j]==0) {
                phi[i*pr[j]] = phi[i] * pr[j];
                break;
            }
            else phi[i*pr[j]]=phi[i]*(pr[j]-1);
        }
    }
    printf("%d\n", phi[0]);
    return 0;
}
