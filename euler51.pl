#!/usr/bin/perl -w
use strict;

my %prime;
my @primes;
my @k;
my $t;
my $flag;
my $s;
my $sum;

sub clear {
    foreach(0..9) {
        $k[$_] = 0;
    }
    $flag = 9;
    $sum = 0;
}

foreach (2..999999) {
    unless (defined($k[$_])) {
        $t = $_;
        push @primes, $t;
        $prime{$t} = 1;
        $_ = 2*$t;
        while ($_<1000000) {
            $k[$_] = 0;
            $_ = $_+$t;
        }
    }
}

foreach (@primes) {
    next if ($_<1000);
    clear();
    $t = $_;

    @_ = split //, $_;
    foreach (@_) {
        $k[$_] += 1;
    }
    foreach (0..2) {
        if ($k[$_] == 3) {
            $flag = $_;
            last;
        }
    }

    if ($flag != 9) {
        foreach ($flag..9) {
            $s = $t;
            $s =~ s/$flag/$_/g;
            $sum++ if (exists $prime{$s});
        }
    }
    if ($sum == 8) {
        print $t."\n";
        last;
    }
}
