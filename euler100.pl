#!/usr/bin/perl -w
use strict;

my ($b, $n)=(3, 4);

($b, $n) = (3*$b+2*$n-2, 4*$b+3*$n-3) while ($n < 1_000_000_000_000); 

print $b."\n";
