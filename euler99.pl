#!/usr/bin/perl -w
use strict;

my $line=0;
my $base=1;
my $exp=1;
my $result;
while (<>) {
    chomp;
    $line++;
    my ($a, $b) = split(/,/);
    next if ($a<$base && $b<$exp);
    next if ($base**($exp/$b) > $a);
    $base = $a;
    $exp = $b;
    $result = $line;
}
print "$result\n";
