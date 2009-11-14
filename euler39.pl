#!/usr/bin/perl -w
use strict;

my $p;
my $a;
my $b;
my $tmp;
my $result=0;
my $big=0;
my %o = (
    '0' => 0,
);
foreach(12..1000) {
    $p = $_;
    foreach (1..int($p/3)) {
        $a = $_;
        foreach (int($p/2-$a)..int(($p-$a)/2)) {
            $b = $_;
            last if ($a>$b);
            $tmp = sqrt($a**2+$b**2);
            $o{$p}++ if ($tmp==$p-$a-$b);
        }
    }
    if (exists $o{$p}) {
        if ($big < $o{$p}) {
            $result = $p;
            $big = $o{$p};
        }
    }
}
#foreach (keys %o) {
#    print "$_ $o{$_}\n";
#}
print "$result\n";
