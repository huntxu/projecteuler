#!/usr/bin/perl -w
use strict;

my $common;
my $num1;
my $num2;
my $a;
my $b;
my $result=1;
foreach(1..9) {
    $common = $_;
    foreach(1..9) {
        next if ($_ == $common);
        $num1 = $_;
        foreach(1..9) {
            next if ($_ == $common || $_ == $num1);
            $num2 = $_;
            $a = $num1*10 + $common;
            $b = $common*10 + $num2;
            if ($a < $b && $a*$num2 == $b*$num1) {
                $result *= $num2;
                $result /= $num1 if ($result % $num1 == 0);
            }
        }
    }
}
print "$result\n";
