#!/usr/bin/perl -w
use strict;

my $sum=0;
while (<>) {
    chomp;
    $sum += $_;
}
print $sum;

