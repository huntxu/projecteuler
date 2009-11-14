#!/usr/bin/perl -w
use strict;
use bignum;

my %hash;
my %h;

sub hash {
    my $num = shift;
    my $tmp = "";
    @_ = sort (split //, $num);
    foreach (@_) {
        $tmp .= $_;
    }
    unless (exists $hash{$tmp}) {
        $h{$tmp} = $num;
        $hash{$tmp} = 1;
        return 0;
    }
    $hash{$tmp}++;
    if ($hash{$tmp} == 5) {
        print "$h{$tmp}\n";
        return 1;
    }
    0;
}

foreach (405..10000) {
    last if (hash($_**3)); 
}
