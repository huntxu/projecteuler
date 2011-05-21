#!/usr/bin/perl -w
use strict;

my @a;
my %not;
$a[100000] = 1;
my @primes;
my @ap;
my $t;
my @set;

sub is_prime {
    my $p = shift;
    foreach (@ap) {
        return 0 if ($p%$_==0);
        last if ($_*$_>$p);
    }
    return 1;
}

foreach (2..100000) {
    if (!defined($a[$_])) {
        push @primes, $_ if $_<20000;
        push @ap, $_;
        $t = $_+$_;
        while ($t<100000) {
            $a[$t]=1;
            $t += $_;
        }
    }
}

shift @primes;
shift @primes;
shift @primes;
unshift @primes, 3;
my $z=$#primes-1;

sub check {
    my $n = shift;
    my $c = $primes[$n];
    $n = 0;
    foreach (@set) {
        last if (exists $not{"$_-$c"});
        if (is_prime($_.$c)==0 || is_prime($c.$_)==0) {
            $not{"$_-$c"}=0;
            $not{"$c-$_"}=0;
            last;
        }
        else {
            $n++;
        }
    }
    return 1 if ($n==$#set+1);
    return 0;
}

my $flag=0;
sub search {
    if ($#set==4) {
        $flag = 1;
        return 0;
    }
    my $k = shift;
    foreach ($k+1..$z) {
        last if ($primes[$_]>10000);
        if (check($_)) {
            push @set, $primes[$_];
            &search($_);
            return 0 if ($flag);
            pop @set;
        }
    }
    1;
}

foreach (0..$z) {
    push @set, $primes[$_];
    last if (search($_)==0);
    pop @set;
}
my $ans=0;
foreach (@set) {
    print "$_\n";
    $ans += $_;
}
print "$ans\n";
