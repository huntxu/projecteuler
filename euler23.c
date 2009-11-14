#include <stdio.h>

int test[30000]={0};
int abundant[30000]={0};
int sum=0;
int numabu=1;
int i,j,k;

int testab(int h) {
    int tmp;
    int b=1;
    for (tmp=2;tmp<=(int)(h/2);tmp++)
	if(h%tmp==0) b+=tmp;
    if (h<b) {
	return 1;
    } else {
	return 0;
    }
}

int main() {
    abundant[0]=12;
    for (i=13;i<=28123;i++) {
	if (testab(i)) abundant[numabu++]=i;
    }
    for (i=0;i<numabu;i++)
	for (j=i;j<numabu;j++) {
	    k=abundant[i]+abundant[j];
	    if (k<=28123) test[k]=1;
	}
    for (i=1;i<=28123;i++)
	if (test[i]==0)
	    sum+=i;
    printf("%d\n",sum);
    return 0;
}
