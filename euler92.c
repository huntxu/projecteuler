#include <stdio.h>
#include <string.h>

/* use icc to compile, a bit faster */
char a[568];
char s[10];

int main()
{
    int i, j, k, t;
    a[1] = 1;
    a[89] = 89;
    for (i=1; i<=567; i++) {
        bzero(s, 10);
        sprintf(s, "%d", i);
        k = 0;
        for (j=0; j<strlen(s); j++) {
            k += (s[j]-0x30)*(s[j]-0x30);
        }
        while (a[k]==0) {
            if (k<=567) a[k] = 2;
            bzero(s, 10);
            sprintf(s, "%d", k);
            k = 0;
            for (j=0; j<strlen(s); j++) {
                k += (s[j]-0x30)*(s[j]-0x30);
            }
        }
        if (a[i] == 0) a[i]=2;
        t = a[k];
        for (j=1; j<=567; j++) {
            if (a[j] == 2) {
                a[j] = t;
            }
        }
    }
    t = 0;
    for (i=1; i<=9999999; i++) {
        bzero(s, 10);
        sprintf(s, "%d", i);
        k = 0;
        for (j=0; j<strlen(s); j++) {
            k += (s[j]-0x30)*(s[j]-0x30);
        }
        if (a[k] == 89) t++;
    }
    printf("%d\n", t);
    return 0;
}
