#!/usr/bin/python

def is_lych(x):
    x += int(str(x)[::-1].lstrip('0'))
    for i in range(1,49):
        t = int(str(x)[::-1].lstrip('0'))
        if (x == t):
            return 0
        else:
            x += t
    return 1

sum = 0
for i in range(1, 10001):
    if (is_lych(i)):
        sum += 1

print sum
