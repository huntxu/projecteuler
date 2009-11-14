#!/usr/bin/python

j=2
k=3
p=2

for i in xrange(3, 101):
    tmp = k
    if (i % 3):
        k = k+j
    else:
        k=p*k+j
        p+=2
    j=tmp
print k
