#include <stdio.h>
#include <string.h>

int i = 21780;
int a = 2178;
char t[10];
char x[2];
int main()
{
    int m;
    while (i++) {
        bzero(t, 10);
        bzero(x, 2);
        sprintf(t, "%d", i);
        for(m=0; m<(strlen(t)-1); m++) {
            if(t[m]<t[m+1]) x[0]++;
            else if(t[m]>t[m+1]) x[1]++;
        }
        if (x[0]*x[1] == 0) a++;
        if (a*100 == i) {
            printf("%d\n", i);
            break;
        }
    }
    return 0;
}
