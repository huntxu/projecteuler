#!/usr/bin/perl -w
use strict;

my @primes = qw(2 3);

sub isprime {
    my $num = shift;
    my $tmp = int(sqrt($num));
    foreach (@primes) {
        return 0 unless ($num % $_);
        last if ($_>$tmp);
    }
    push @primes, $num;
    1;
}

sub gcd {
    my ($m, $n)=@_;
    while ($m!=0) {
        $n %= $m;
        return $m unless ($n);
        $m %= $n;
    }
    return $n;
}

my $sum=0;
foreach my $k (5..10000) {
    if(isprime($k)) {
        $sum+=int($k/2)-int($k/3);
    }
    else {
        foreach (int($k/3)+1..int($k/2)) {
            $sum++ if (gcd($_, $k)==1);
        }
    }
#    print "$k\n";
}
print "$sum\n";
