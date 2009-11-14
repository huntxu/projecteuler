#include <stdio.h>
#include <string.h>

char prime[10001];
char r[5];
char s[5];
char t[5];

void bubble(char *string)
{
    char tmp;
    int i, j;
    for (i=1; i<4; i++) {
        for (j=3; j>=i; j--) {
            if(string[j] < string[j-1]) {
                tmp = string[j-1];
                string[j-1] = string[j];
                string[j] = tmp;
            }
        }
    }
}

int main()
{
    int i, j;
    char a;
    for (i=2; i<=10000; i++) {
        if (prime[i]==0) {
            for (j=(i<<1); j<=10000; j+=i) {
                prime[j]=1;
            } 
        }
    }
    for (j=9; j<4500; j+=9) {
        for (i=1000; i<=10000-2*j; i++) {
            if (prime[i]==0 && prime[i+j]==0 && prime[i+2*j]==0) {
                bzero(r, 5);
                bzero(s, 5);
                bzero(t, 5);
                sprintf(r, "%d", i);
                sprintf(s, "%d", i+j);
                sprintf(t, "%d", i+2*j);
                bubble(r);
                bubble(s);
                bubble(t);
                if (strcmp(r, s)==0 && strcmp(r, t)==0) {
                    printf("%d %d %d\n", i, i+j, i+2*j);
                }
            }
        }
    }
    return 0;
}
