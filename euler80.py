#!/usr/bin/python

def getnextdigit(a, b):
    a *= 20
    b *= 100
    c = b/a
    while ((a+c)*c>b):
        c -= 1
    return c, b-c*(a+c)

def main():
    s = 0
    for i in xrange(2, 100):
        if (int(i**0.5) != i**0.5):
            t = 1
            while (not(t**2<i and (t+1)**2>i)):
                t+=1
            s += t
            k = 1
            n = i-t**2
            while (k<100):
                m, n = getnextdigit(t, n)
                s += m
                t = 10*t + m
                k+=1
    print s


if __name__ == '__main__':
    main()
