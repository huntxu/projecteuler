#!/usr/bin/perl -w
use strict;

sub isprime {
    my $num = shift;
    foreach (3..int(sqrt($num))) {
        next if ($_%2 == 0);
        return 0 if ($num % $_ == 0);
    }
    return 1;
}

my $a = 31;
my $b = 37;
my $c = 43;
my $d = 49;
my $total = 13;
my $prime = 8;
my $add = 26;

while (1) {
    $a += $add;
    $add += 2;
    $b += $add;
    $add += 2;
    $c += $add;
    $add += 2;
    $d += $add;
    $add += 2;
    $total += 4;
    $prime += 1 if isprime($a);
    $prime += 1 if isprime($b);
    $prime += 1 if isprime($c);
    $prime += 1 if isprime($d);
    last if ($prime/$total < 0.1);
}
printf "%d\n",($total+1)/2;
