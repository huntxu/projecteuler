#!/usr/bin/perl -w
use strict;

my $sum=0;
while (<>) {
    chomp;
    @_ = split //;
    foreach(@_) {
        $sum += $_;
    }
}
printf "%d\n", $sum;
