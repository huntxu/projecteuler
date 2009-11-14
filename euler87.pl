#!/usr/bin/perl -w
use strict;

my @prime = qw{ 2 3 5 };
my @sq = qw{ 4 9 25 };
my @cu = qw{ 8 27 125 };
my @fo = qw{ 16 81 625 };

my @cf;
my @all;

sub is_prime
{
    my $t = shift;
    foreach(@prime) {
        return 0 unless ($t % $_);
        last if $_**2 > $t;
    }
    1;
}

for ($_=7; $_<=7071; $_+=2) {
    if (is_prime($_)) {
        push @prime, $_;
        push @sq, $_**2 if $_<=7071;
        push @cu, $_**3 if $_<=368;
        push @fo, $_**4 if $_<=84;
    }
}

foreach (@fo) {
    my $c = $_;
    foreach (@cu) {
        my $k = $c + $_;
        push @cf, $k if ($k<50000000);
    }
}

foreach (@sq) {
    my $c = $_;
    foreach (@cf) {
        my $k = $c + $_;
        push @all, $k if ($k<=50000000);
    }
}

my $result = 0;
my $last = 0;
foreach (sort {$a<=>$b} @all) {
    next if $_ == $last;
    $last = $_;
    $result++;
}

print $result."\n";

