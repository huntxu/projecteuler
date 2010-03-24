#include <stdio.h>
#include <strings.h>

char v[10], s[10];
int point[6] = {100000000, 1, 16, 256, 4096, 65536};


int score(int a) {
    char n[15], t[5], board[6];
    bzero(n, 15);
    bzero(t, 5);
    bzero(board, 6);

    int i, j, low=(a-1)*5, high=a*5;
    for (i=low; i<high; i++) {
        n[v[i]]++;
        t[s[i]]++;
    }

    int num_max=0, count_max=0, card_count=0, card_min=15, card_max=0;
    int suits=0;

    for (i=1; i<=4; i++) {
        if (t[i]>0) suits++;
    }

    for (i=2; i<=14; i++) {
        if (n[i]>0) {
            card_count++;
            if (i<card_min) card_min=i;
            else if (i>card_max) card_max=i;
            if (n[i]>count_max) {
                count_max=n[i];
                num_max = i;
            }
        }
    }

    if (suits == 1) {
        board[0] = 6;
        if (card_max - card_min == 4) {
            board[0] = 9;
            if (card_max == 14) {
                board[0] = 10;
            }
        }
    }
    else {
        if (card_count == 2) {
            board[0] = 7;
            if (count_max == 4) board[0]=8;
        }
        else if (card_count == 3) {
            board[0] = 3;
            if (count_max == 3) board[0]=4;
        }
        else if (card_count == 4) {
            board[0] = 2;
        }
        else {
            board[0] = 1;
            if (card_max - card_min == 4) board[0]=5;
        }
    }

    if (board[0] == 10) {
    }
    else if (board[0] == 5 || board[0] == 9) {
        board[5] = card_max;
    }
    else if (board[0] == 4 || board[0] == 7 || board[0] == 8) {
        board[5] = num_max;
    }
    else if (board[0] == 1 || board[0] == 6) {
        for (i=2, j=1; i<=14 && j<=5; i++) {
            if (n[i]>0) {
                board[j++] = i;
            }
        }
    }
    else if (board[0] == 2) {
        for (i=2, j=1; i<=14 && j<=4; i++) {
            if (n[i]>1) {
                board[5] = i;
                j++;
            }
            else if (n[i]>0) {
                board[j++] = i;
            }
        }
    }
    else {
        for (suits=0, i=2, j=1; i<=14 && j<=3; i++) {
            if (n[i]>1) {
                board[4+suits] = i;
                suits++;
                j++;
            }
            else if (n[i]>0) {
                board[j++] = i;
            }
        }
    }

    int score = 0;
    for (i=0; i<=5; i++) {
        score += board[i]*point[i];
    }
    return score;
}

int vton(char a) {
    if (a == 'T') return 10;
    else if (a == 'J') return 11;
    else if (a == 'Q') return 12;
    else if (a == 'K') return 13;
    else if (a == 'A') return 14;
    else return a-0x30;
}

int ston(char b) {
    if (b == 'H') return 1;
    else if (b == 'C') return 2;
    else if (b == 'D') return 3;
    else if (b == 'S') return 4;
}

int main()
{
    int i, j, win=0;
    char a, b;
    for (i=0; i<1000; i++) {
        bzero(v, 10);
        bzero(s, 10);
        for(j=0; j<10; j++) {
            scanf("%c%c", &a, &b);
            v[j] = vton(a);
            s[j] = ston(b);
            if (j == 9) {
                scanf("\n");
            }
            else {
                scanf(" ");
            }
        }
        if (score(1) > score(2)) {
            win++;
        }
    }
    printf("%d\n", win);
    return 0;
}
