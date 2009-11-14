#!/usr/bin/perl -w
use strict;

my @lines;
while (<>) {
    chomp;
    unshift @lines, $_;
}

my $n;
my @total;
$total[100]='0';
foreach (0..99) {
    $total[$_]=0;
}
foreach (@lines) {
    @_ = split / /;
    $n = 0;
    foreach (@_) {
        if ($total[$n]>=$total[$n+1]) {
            $total[$n] += $_;
        }
        else {
            $total[$n] = $_ + $total[$n+1];
        }
        $n++;
    }
}
printf "%d\n", $total[0];
