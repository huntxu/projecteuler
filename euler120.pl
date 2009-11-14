#!/usr/bin/perl -w
use strict;

my $sum = 0;
foreach (3..1000) {
    if ($_ % 2) {
        $sum += $_*($_-1);
    }
    else {
        $sum += $_*($_-2);
    }
}
print $sum."\n";
