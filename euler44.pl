#!/usr/bin/perl -w
use strict;

my %pens;

foreach (6..3000) {
    $pens{$_*(3*$_-1)/2} = 1;
}

my @pens = sort {$a<=>$b} keys %pens;

foreach my $j (@pens) {
    shift;
    foreach (@pens) {
        if (exists $pens{$_+$j} && exists $pens{$_-$j}) {
            printf "%d\n", $_-$j;
            exit;
        }
    }
}
