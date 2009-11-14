#!/usr/bin/perl -w
use strict;

sub ispal {
    my $num = sprintf("%b", shift);
    @_ = split //, $num;
    foreach (1..int(@_/2)) {
        return 0 unless ((shift @_)==(pop @_));
    }
    1;
}
my $length;
my $sum=0;
for (my $k=1; $k<1000; $k++) {
    $length = length($k);
    if ($length == 1) {
        next unless ($k%2);
        $_ = $k;
        $sum += $_ if (ispal($_));
        $_ = $k.$k;
        $sum += $_ if (ispal($_));
    }
    elsif ($length == 2) {
        $k =~ /(\d)(\d)/;
        next unless ($1%2);
        $_ = $1.$2.$1;
        $sum += $_ if (ispal($_));
        $_ = $1.$2.$2.$1;
        $sum += $_ if (ispal($_));
    }
    else {
        $k =~ /(\d)(\d)(\d)/;
        next unless ($1%2);
        $_ = $1.$2.$3.$2.$1;
        $sum += $_ if (ispal($_));
        $_ = $1.$2.$3.$3.$2.$1;
        $sum += $_ if (ispal($_));
    }
}
print "$sum\n";
