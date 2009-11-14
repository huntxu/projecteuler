#!/usr/bin/perl -w
use strict;

my %primes = (
        '2' => 1,
        '3' => 1,
        '5' => 1,
        );
my @primes = (2, 3, 5);

sub isprime {
    my $num = shift;
    return 1 if (exists $primes{$num});
    foreach (@primes) {
        return 0 if ($num % $_ == 0);
    }
    push @primes, $num;
    $primes{$num} = 1;
    return 1;
}

foreach (7..10000) {
    isprime($_);
}

my $a;
my $b;
my $n;
my $big = 0;
my $result;
my $tmp;
foreach $a (-999..999) {
    next unless( $a % 2);
    foreach $b (101..999) {
        $n = 1;
        while (1) {
            $tmp = $n**2 + $a*$n + $b;
            last unless (exists $primes[$b]);
            unless (isprime($tmp)) {
                if ($n > $big) {
                    $big = $n;
                    $result = $a*$b;
                }
                last;
            }
            $n+=2;
        }
    }
}
print "$result\n";
