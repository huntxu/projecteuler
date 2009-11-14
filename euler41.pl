#!/usr/bin/perl -w
use strict;

my @p = (1..3161);
my %primes;
my @primes;
foreach $a (2..3161) {
    next unless (defined($p[$a]));
    for (my $k=$a+$a; $k<=3161; $k+=$a) {
        undef $p[$k];
    }
    $primes{$a} = 0;
    push @primes, $a;
}

sub ispandigital {
   @_ = sort split //, shift;
   my $n=1;
   foreach (@_) {
       return 0 unless ($_==$n++);
   }
   1;
}

sub isprime {
    my $num = shift;
    foreach (@primes) {
        return 0 if ($num % $_ == 0);
    }
    return 1;
}

for (my $k=7654321;;$k-=2) {
    next unless ($k % 5);
    next unless (ispandigital($k));
    if (isprime($k)) {
        print "$k\n";
        last;
    }
}
