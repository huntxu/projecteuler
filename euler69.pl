#!/usr/bin/perl -w
use strict;

my @prime = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
my $mul = 1;
my $result;
foreach (@prime) {
    $mul *= $_;
    last if ($mul>1000000);
    $result = $mul;
}
print "$result\n";
