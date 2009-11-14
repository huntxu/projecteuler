#!/usr/bin/perl -w
use strict;
use bignum;

my $m = 2;
my $n = 3;
my $tmp;
my $result = 0;
foreach (2..1000) {
    $tmp = $m;
    $m += $n;
    $n = $m + $tmp;
    $result++ if (length($n)>length($m));
}
print $result."\n";
