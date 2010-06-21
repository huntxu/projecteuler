#!/usr/bin/perl -w
use strict;

my @network;
my @vertices;
my %tree;

sub sum_network
{
    my ($m, $n);
    my $l = 0;
    foreach (1..39) {
        $m = $_;
        foreach ($m+1..40) {
            $n = $network[$m][$_];
            $l += ($n eq '-')?0:$n;
        }
    }
    $l;
}

sub find_next_v
{
    my ($i, $m);
    my $min = 100000000;
    foreach (@vertices) {
        $m = $_;
        foreach (1..40) {
            next if (exists($tree{$_}) || $network[$m][$_] eq '-');
            if ($network[$m][$_]<$min) {
                $min = $network[$m][$_];
                $i = $_;
            }
        }
    }
    ($i, $min);
}

push @network, [0];
while (<>) {
    chomp;
    push @network, [0, split /,/];
}

my $length = sum_network();

push @vertices, 1;
$tree{1} = 1;

while (@vertices<40) {
    my ($a, $b) = find_next_v();
    push @vertices, $a;
    $tree{$a} = 1;
    $length -= $b;
}
print "$length\n";
