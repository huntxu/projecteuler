#!/usr/bin/perl -w
use strict;

my @p=(1..9999);
my %primes;
my @primes;
foreach my $k (2..9999) {
    next unless defined $p[$k];
    for (my $j=$k+$k; $j<10000; $j+=$k) {
        undef $p[$j];
    }
    push @primes, $k;
    $primes{$k} = 1;
}

my %squares;
foreach (1..70) {
    $squares{2*($_**2)} = 1;
}
my $flag;
for (my $k=3; $k<=10000; $k+=2) {
    next if exists $primes{$k};
    $flag = 0;
    foreach (@primes) {
        last unless $_<$k;
        if (exists $squares{$k-$_}) {
            $flag = 1;
            last;
        }
    }
    unless($flag) {
        print "$k\n";
        last;
    }
}
