#!/usr/bin/perl -w
use strict;

my @prime =(2);
my @composite;
my @t = ([],[],[2],);
my %time = (2, 3);

my $k = 4000000;
my $p = 2;
my $flag;

$k <<= 1;
while (3**($#prime+1) < $k) {
    $p ++;
    $flag = 0;
    foreach (@prime) {
        unless ($p % $_) {
            push @composite, $p;
            push @t, [sort {$a<=>$b} ($_, @{$t[$p/$_]})];
            $flag = 1;
            last;
        }
    }
    next if ($flag);
    push @prime, $p;
    push @t, ([$p]);
    $time{$p} = 3;
}

my $n = 3**($#prime+1);
my $saven;
my $ans = 1;
my %time_dup;
foreach (@prime) {
    $ans *= $_**(($time{$_}-1)/2);
}
$flag = 0;

while ($n >= $k) {
    $saven = $n;
    %time_dup = %time;
    $p = pop @prime;
    foreach (@composite) {
        $n /= $time{$p};
        my $c = $_;
        my $sub = 0;
        if ($c > $p) {
            $flag = 1;
            last;
        }
        foreach (@{$t[$c]}) {
            $n /= $time_dup{$_};
            $time_dup{$_} += 2;
            $n *= $time_dup{$_};
        }
        if ($n >= $k) {
            foreach (@{$t[$c]}) {
                $time{$_} += 2;
            }
            $ans /= $p;
            $ans *= $c;
            $sub = 1;
        }
        else {
            $n = $saven;
            %time_dup = %time;
        }
        last if ($sub);
    }
    $n = 0 if ($flag);
}

$ans = sprintf "%.20g", $ans;
print $ans."\n";
