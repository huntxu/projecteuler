#!/usr/bin/perl -w
use strict;

my @b = (0, 1, 1, 1, 1);
foreach (1..8) {
    my @a;
    foreach ($_..$_*4) {
        my $n = $_;
        foreach (1..4) {
            $a[$_+$n] += $b[$n];
        }
    }
    foreach (0..$_) {
        $a[$_]=0;
    }
    @b = @a;
}

my @d = (0, 1, 1, 1, 1, 1, 1);
foreach (1..5) {
    my @a;
    foreach ($_..$_*6) {
        my $n = $_;
        foreach (1..6) {
            $a[$_+$n] += $d[$n];
        }
    }
    foreach (0..$_) {
        $a[$_]=0;
    }
    @d = @a;
}

foreach (0..35) {
    $b[$_+1] += $b[$_];
    $d[36] += $d[$_];
}

my $s;
foreach (6..35) {
    $s += $d[$_]/$d[36]*($b[36]-$b[$_])/$b[36];
}
print $s."\n";
