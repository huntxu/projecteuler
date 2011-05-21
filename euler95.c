#include <stdio.h>

#define N 1000000

int a[N+1];
char b[N+1];

int main()
{
    int i, j, length, small;
    int longest=0, smallest=N+1;
    for (i=1; i<=500000; i++) {
        if (a[i]>=0) {
            for (j=(i<<1); j<=N; j+=i) {
                if (a[j] >= 0) {
                    a[j] += i;
                    if (a[j]>N) {
                        a[j] = -1;
                    }
                }
            }
        }
    }
    for (i=2; i<=N; i++) {
        j = i;
        length = 1;
        small = N+1;
        memset(b, 0, (N+1)*sizeof(char));
        while (a[j]>0 && b[a[j]]!=1) {
            length ++;
            if (a[j]<small) {
                small = a[j];
            }
            if (a[j] == i) {
                if (length>longest) {
                    longest = length;
                    smallest = small;
                }
                break;
            }
            b[a[j]] = 1;
            j = a[j];
        }
    }
    printf("%d %d\n", longest, smallest);
    return 0;
}
