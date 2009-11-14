#include <stdio.h>

int i=1;
int t=8;
int s=0;
int k=1000000;
int main()
{
    while (t<=k) {
        s += (int)((k-t)/(4*i))+1;
        i ++;
        t += 8*i;
    }
    printf("%d\n", s);
    return 0;
}
