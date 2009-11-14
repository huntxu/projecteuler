#!/usr/bin/perl -w
use strict;

#2:1..6
#3:1..4
#5/6/7/10:1..2
#sort -nu算非重复...
#(99-18)*99-所有非重复和...

my $a;
for (1..6) {
    $a=$_;
    for (2..100) {
	print $a*$_."\n";
    }
}
