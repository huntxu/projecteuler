#!/usr/bin/perl -w
use strict;
use bignum;

sub digitsum
{
    @_ = split //, shift;
    my $n=0;
    foreach (@_) {
        $n += $_;
    }
    $n;
}

my @a;
my $i = 1;
my $k=10**20;
while ($i<9*length($k)) {
    $i ++;
    my $m =$i;
    while ($m<10) {
        $m *= $i;
    }
    while ($m<$k) {
        if (digitsum($m)==$i) {
            push @a, $m;
            @a = sort {$a<=>$b} @a;
        }
        $m *= $i;
    }
    if ($#a>=30) {
        $k = $a[29];
    }
}
print "$a[29]\n";
