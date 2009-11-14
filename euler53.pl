#!/usr/bin/perl -w
use strict;

my $num = 1144066;
my $r = 10;
sub cal {
    my $n = shift;
    my $o = $n - $r;
    $num = $num * $n / $o;
    $o++;
    my $tmp;
    while (1) {
        $tmp = $num * $r / $o;
        if ($tmp < 1000000) {
            return $n-$r-$r+1;
        }
        $r--;
        $o++;
        $num = $tmp;
    }
}
my $sum = 4;
foreach(24..100) {
    $sum += cal($_);
}
printf "%d\n", $sum;
