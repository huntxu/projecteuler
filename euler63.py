#!/usr/bin/python

sum = 0
for i in range(4, 10):
    for j in range(2, 30):
        if(i**j >= 10**(j-1)):
            sum+=1
#            print i, j, i**j
print sum+9
