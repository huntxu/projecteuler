#include <stdio.h>

#define MIN 999
#define MAX 10000
#define S_INSERT(x, y) if (x>MIN && x<MAX) {insert(x, y);}

enum Group {
    TRIANGLE    = 1,
    SQUARE      = 1<<1,
    PENTAGONAL  = 1<<2,
    HEXAGONAL   = 1<<3,
    HEPTAGONAL  = 1<<4,
    OCTAGONAL   = 1<<5,
};

struct num {
    int _two_digits;
    enum Group _group;
} table[100][20];

int count[100]={0};

void insert(int j, enum Group group)
{
    struct num *unit;
    int k = j%100;
    j = (j-k)/100;
    if (k<10) {
        return;
    }
    else {
        unit = &table[j][count[j]];
        unit -> _two_digits = k;
        unit -> _group = group;
        count[j]++;
    }
}

int state=0;
int head;
int result[7];

int search(int m, int n)
{
    int k = table[m][n]._two_digits;
    result[0]++;
    result[result[0]]=k;
    int i;
    state |= table[m][n]._group;
    if (!(state^63) && k==head) {
        return 1;
    }
    for (i=0; i<count[k]; i++) {
        if (!(state & table[k][i]._group)) {
            if (search(k, i)==1) {
                return 1;
            }
        }
    }
    state -= table[m][n]._group;
    result[0]--;
    return 0;
}

int main()
{
    int i, j;
    int sum=0;
    for (i=1; i*(i+1)/2<10000; i++) {
        S_INSERT(i*(i+1)/2, TRIANGLE);
        S_INSERT(i*i, SQUARE);
        S_INSERT(i*(3*i-1)/2, PENTAGONAL);
        S_INSERT(i*(2*i-1), HEXAGONAL);
        S_INSERT(i*(5*i-3)/2, HEPTAGONAL);
        S_INSERT(i*(3*i-2), OCTAGONAL);
    }
    for (i=10; i<=99; i++) {
        head = i;
        for (j=0; j<count[i]; j++) {
            if (search(i, j)) {
                for (j=1; j<=6; j++) {
                    sum += result[j]*101; 
                }
                i = MAX;
                break;
            }
        }
    }
    printf("%d\n", sum);
    return 0;
}
