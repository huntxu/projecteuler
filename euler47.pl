#!/usr/bin/perl -w
use strict;

my @factors;
my $val;
my $count;

foreach my $i (2..200000) {
    if (!defined($factors[$i])) {
        $val = $i;
        $count =0;
        while ($val<200000) {
            unless (defined($factors[$val])) {
                $factors[$val]=0;
            }
            $factors[$val]++;
            $val += $i;
        }
    }
    elsif ($factors[$i]==4) {
        $count++;
        if ($count==4) {
            printf "%d\n", $i-3;
            last;
        }
    }
    else{
        $count=0;
    }
}
