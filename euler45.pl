#!/usr/bin/perl -w
use strict;

my %p;
my %h;
my $tmp;

foreach my $k (144..100000) {
    $h{$k*(2*$k-1)} = 1;
    $p{$k*(3*$k-1)/2} = 1;
    $tmp = $k*($k+1)/2;
    if (exists $h{$tmp} && exists $p{$tmp}) {
        print "$tmp\n";
        last;
    }
}
