#include <stdio.h>
#define MAX 1000000

int l[MAX+1] = {0};

int main()
{
    int i, j, s;
    for (i=4, j=2; i*j<=MAX; i+=4, j++) {
        s = i*j;
        while (s<=MAX) {
            l[s]++;
            s += i;
        }
    }
    s = 0;
    for (i=1; i<=MAX; i++) {
        if (l[i]>=1 && l[i]<=10) s++;
    }
    printf("%d\n", s);
    return 0;
}
