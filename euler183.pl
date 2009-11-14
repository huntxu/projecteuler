#!/usr/bin/perl -w
use strict;

sub gcd {
    my ($m, $n)=@_;
    while ($m!=0) {
        $n %= $m;
        return $m unless ($n);
        $m %= $n;
    }
    return $n;
}

my $sum = 0;
my $i;
foreach (5..10000) {
    $i = int($_/exp(1)+0.5);
    $i /= gcd($i, $_);
    while ($i % 2 == 0) {
        $i /= 2;
    }
    while ($i % 5 == 0) {
        $i /= 5;
    }
    if ($i == 1) {
        $sum -= $_;
    }
    else {
        $sum += $_;
    }
}
printf "%d\n", $sum;
