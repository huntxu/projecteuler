#!/usr/bin/perl -w
use strict;

my @squares;
my %sum;
my %sumnum;

sub is_suqare
{
    my $k = shift;
    if (int(sqrt($k))**2==$k) {
        return 1;
    }
    0;
}

sub findxyz
{
    my ($a, $b, $tmp) = @_;
    my ($c, $d, $e, $f);
    my ($x, $y, $z) = (($a+$b)/2, ($a-$b)/2, 0);
    @_ = split /\+/, $tmp;
    foreach (@_) {
        ($e, $f) = split /-/, $_;
        $z = ($e-$f)/2;
        if (is_suqare($x+$z) && is_suqare($x-$z)) {
            return $x+$y+$z;
        }
    }
    0;
}

foreach (1..1000) {
    my $n = $_**2;
    my $m;
    if ($#squares) {
        foreach (@squares) {
            next if (($n+$_)&1);
            $m = $n + $_;
            if (defined($sum{$m})) {
                $sum{$m} .= "+$n-$_";
                $sumnum{$m}++;
            }
            else {
                $sum{$m} = "$n-$_";
                $sumnum{$m} = 1;
            }
            if (defined($sum{$n-$_}) && $sumnum{$m}>1) {
                $m = findxyz($n, $_, $sum{$n-$_});
            }
            else {
                $m = 0;
            }
            last unless ($m == 0);
        }
    }
    if ($m) {
        print "$m";
        last;
    } 
    push @squares, $n;
}
