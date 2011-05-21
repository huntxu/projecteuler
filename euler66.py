#!/usr/bin/python

ans = 0
result = 0

for i in range(1, 1001):
    n = int(i**0.5)
    if (n**2!=i):
        a = n
        t = n
        b = 1
        flag = 1
        kkk = 1
        kk = 0
        hhh = 0
        hh = 1
        while (flag):
            k = kkk+t*kk
            h = hhh+t*hh
            if (h**2-i*k**2==1):
                flag = 0
            kkk = kk
            kk = k
            hhh = hh
            hh = h
            t = int(b*(n+a)/(i-a**2))
            b = (i-a**2)/b
            a = int((n+a)/b)*b-a
        if (result < h):
            result = h
            ans = i

print ans, result
