#!/usr/bin/perl -w
use strict;

my $sum;
my $result = 0;
while (<>) {
    chomp;
    $sum = 0;
    @_ = split(//);
    foreach (@_) {
        $sum += $_;
    }
    $result = $sum if ($sum > $result);
}
print $result."\n";
