#!/usr/bin/perl -w
use strict;

my @primes=(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97);
my @nums=(1);
my $m;

foreach (@nums) {
    $m = $_;
    foreach (@primes) {
        if ($_*$m<=1000000000) {
            push @nums, $m*$_;
        }
        else {
            last;
        }
        last unless ($m%$_);
    }
}

print $#nums+1 ."\n";
