#!/usr/bin/perl -w
use strict;

my @p;
my @x;
my @y;
my @z;
my @s;

sub issixty
{
    my $l=0;
    my $k = shift;
    my $n = $k;
    my $t;
    my %h;
    while (!defined($h{$k})) {
        $h{$k} = 1;
        $t = $k;
        $k = 0;
        foreach (split //, $t) {
            $k += $p[$_];
        }
        $l ++;
    }
    $l==60 && push @s, $n;
}

sub knights
{
    my %hh;
    shift;
    my $m = (@_ = (/\d/g));
    my $zeroes = (@_ = (/0/g));
    $m -= $zeroes;
    $m *= $zeroes>0?$p[$m+$zeroes-1]:$p[$m-1];

    @_ = split //;
    foreach (@_) {
        (defined($hh{$_})) && ($hh{$_}++) || ($hh{$_}=1);
    }
    foreach (values %hh) {
        $m /= $p[$_];
    }
    return $m;
}

push @p, 1;
foreach (1..9) {
    push @p, $_*$p[$_-1];
    push @x, $_;
}

my $a;

foreach (@x) {
    issixty($_);
}

foreach (@x) {
    $a = $_;
    foreach (@x) {
        $a > $_ && next;
        push @y, $a.$_;
        issixty($a.$_);
    }
}

foreach (@x) {
    $a = $_;
    foreach (@y) {
        $a > int($_/10) && next;
        push @z, $a.$_;
        issixty($a.$_);
    }
}

foreach (@y) {
    $a = $_;
    foreach (@y) {
        $a%10 > int($_/10) && next;
        issixty($a.$_);
    }
}

foreach (@y) {
    $a = $_;
    foreach (@z) {
        $a%10 > int($_/100) && next;
        issixty($a.$_);
    }
}

foreach (@z) {
    $a = $_;
    foreach (@z) {
        $a%10 > int($_/100) && next;
        issixty($a.$_);
    }
}

my $result=0;
foreach (@s) {
    $result += knights($_);
    s/1/0/ && push @s, $_;
}
print "$result\n";
