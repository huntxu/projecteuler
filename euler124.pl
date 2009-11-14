#!/usr/bin/perl -w
use strict;

my @num=(0, 1..100000);
my %rad;
my $i;
my $tmp;
for ($i=1; $i<=100000; $i++) {
    if (!defined $rad{$i}) {
        $rad{$i} = $num[$i];
    }
    next if ($num[$i] == 1);
    $tmp = $num[$i];
    for ($_ = $i; $_<=100000; $_+=$tmp) {
        unless ($num[$_] % $tmp) {
            if (!defined $rad{$_}) {
                $rad{$_} = $tmp;
            }
            elsif ($rad{$_} % $tmp) {
                $rad{$_} *= $tmp;
            }
            $num[$_] /= $tmp;
        }
    }
}
my @final = sort {
    $rad{$a} <=> $rad{$b}
        or
    $a <=> $b
} keys %rad;
#foreach (@final) {
#    printf "%d %d\n", $_, $rad{$_};
#}
printf "%d\n", $final[9999];
