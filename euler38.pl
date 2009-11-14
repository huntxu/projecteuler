#!/usr/bin/perl -w
use strict;

sub pandigital {
    $_ = shift;
    @_ = sort(split(//));
    my $tmp = 1;
    foreach (@_) {
        return 0 if ($_ != $tmp++);
    }
    return 1;
}

my $a;
my $b;
my $num;
my @pandigitals;
foreach (5..9) {
    $a = $_;
    $num = "";
    foreach (1..5) {
        $b = $_;
        $num .=  $a*$b;
    }
    push @pandigitals, $num if pandigital($num);
}
foreach (25..33) {
    $a = $_;
    $num = "";
    foreach (1..4) {
        $b = $_;
        $num .=  $a*$b;
    }
    push @pandigitals, $num if pandigital($num);
}
foreach (100..333) {
    $a = $_;
    $num = "";
    foreach (1..3) {
        $b = $_;
        $num .=  $a*$b;
    }
    push @pandigitals, $num if pandigital($num);
}
foreach (5000..9999) {
    $a = $_;
    $num = "";
    foreach (1..2) {
        $b = $_;
        $num .=  $a*$b;
    }
    push @pandigitals, $num if pandigital($num);
}
@_ = sort(@pandigitals);
printf "%d\n", pop @_;
