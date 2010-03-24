#include <stdio.h>
/* dijkstra, rewrite with spfa...*/
/* dx, dy两个向量*/
#define MAX 80
char flag[MAX][MAX]={0};
unsigned int num[MAX][MAX];
unsigned int total[MAX][MAX]={0};

struct matrix{
    int x;
    int y;
} t;

struct matrix search()
{
    struct matrix k;
    int i, j, max=999999999;
    for (i=0; i<MAX; i++) {
        for (j=0; j<MAX; j++) {
            if ((flag[i][j] == 0) && (total[i][j] <= max)) {
                k.x = i;
                k.y = j;
                max = total[i][j];
            }
        }
    }
    return k;
}

void draw(struct matrix k, struct matrix p) {
    int t;
    if (p.x>=0 && p.x<MAX && p.y>=0 && p.y<MAX) {
        t = total[k.x][k.y] + num[p.x][p.y];
        if (t < total[p.x][p.y]) {
            total[p.x][p.y] = t;
        }
    }
}

void remap(struct matrix k)
{
    struct matrix p;

    p.x = k.x-1;
    p.y = k.y;
    draw(k, p);

    p.x = k.x+1;
    p.y = k.y;
    draw(k, p);

    p.x = k.x;
    p.y = k.y-1;
    draw(k, p);

    p.x = k.x;
    p.y = k.y+1;
    draw(k, p);
}

int main()
{
    int i, j;
    for (i=0; i<MAX; i++) {
        for (j=0; j<MAX; j++) {
            total[i][j] = ~total[i][j];
            scanf("%d", &num[i][j]);
            if (j==MAX-1) {
                scanf("\n");
            }
            else {
                scanf(",");
            }
        }
    }
    total[0][0] = num[0][0];
    while (flag[MAX-1][MAX-1] == 0) {
        t = search();
        remap(t);
        flag[t.x][t.y] = 1;
    }
    printf("%d\n", total[MAX-1][MAX-1]);
    return 0;
}
