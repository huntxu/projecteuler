#!/usr/bin/perl -w
use strict;

my $tmp;
my $a;
my $b;
my $d;
my $big=0;
my $result;
foreach (2..999) {
    $b = $_;
    $a = 1;
    $d = 1;
    my %k;
    while (1) {
        $tmp = $a % $b;
        last if ($tmp == 0);
        if (exists($k{$tmp})) {
            $_ = $d-$k{$tmp};
            if ($big < $_) {
                $big = $_;
                $result = $b;
            }
#verbose            printf "%d %d\n", $b, $d-$k{$tmp};
            last;
        }
        else {
            $k{$tmp} = $d;
            $d++;
            $a = $tmp * 10;
        }
    }
}
print "$result\n";
