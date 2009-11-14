#!/usr/bin/perl -w
use strict;

my ($x, $y);
my $result = 0;
while (<>) {
    chomp;
    my ($x1, $y1, $x2, $y2, $x3, $y3) = split /,/;
    if (($x3 == 0) || ($x1 == $x2)) {
        ($x, $y) = ($x3, $y3);
        ($x3, $y3) = ($x2, $y2);
        ($x2, $y2) = ($x, $y);
    }
    $x = ($y1 - ($y2-$y1)*$x1/($x2-$x1)) / ($y3/$x3 - ($y2-$y1)/($x2-$x1));
    $y = $y3 / $x3 * $x;
    $result ++ if (($x*$x3<0) && (($x2-$x)*($x1-$x)<0));
}

printf "%d\n", $result;
