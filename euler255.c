#include <stdio.h>
int j, sum=0;
int main()
{
    int i, t, k;
    double r;
    for (i=10000000; i<100000000; i+=10) {
        j=7000;
        t=1;
        k=j;
        while (t++) {
            k=(int) ((k + ((i % k) ? (int) (i/k)+1 : (i/k)))/2);
            if (k==j) {
                sum+=(t-1)*10;
                t=0;
            }
            else {
                j=k;
            }
        }
    }
    r=(double) sum/90000000;
    printf("%.10f\n", r);
    return 0;
}
