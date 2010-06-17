#!/usr/bin/perl -w
use strict;

sub sq
{
    my ($a, $b) = @_;
    my $c = $a*$a+$b*$b;
    my $d = int(sqrt($c));
    if ($d*$d == $c) {
        return $a>$b?int($b/2):int($a-$b/2)+1;
    }
    else {
        return 0;
    }
}

my $s = 2060;
my $m = 100;

while ($m++) {
    foreach (2..$m*2) {
        $s += sq($m, $_);
    }
    if ($s>=1000000) {
        $s = $m;
        $m = 0;
    }
}

print "$s\n";
