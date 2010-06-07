#!/usr/bin/perl -w
use strict;

my $result=0;
my ($n, $a, $aa, $b, $bb, $flag, $s);

foreach (1..99) {
    $n = $_;
    foreach ($n**2+1..($n+1)**2-1) {
        ($a, $aa, $b, $bb, $flag, $s) = ($n, $n, 1, 1, 1, 0);
        while ($flag) {
            $b = ($_-$a*$a)/$b;
            $a = int(($n+$a)/$b)*$b-$a;
            $s ^= 1;
            $flag=0 unless ($a^$aa || $b^$bb);
        }
        $result++ if ($s);
    }
}

print "$result\n";
