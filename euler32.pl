#!/usr/bin/perl -w
use strict;

my $multiplicand;
my $multiplier;
my $product;
my $tmp;
my @products;
foreach (2..99) {
    $multiplicand = $_;
    foreach (100..int(10000/$multiplicand)) {
        $multiplier = $_;
        $product = $multiplicand * $multiplier;
        next if (($product % 10 == 0)||($product < 1000));
        $tmp = 1;
        $_ = $multiplicand.$multiplier.$product;
        @_ = split(//);
        @_ = sort @_;
        foreach(@_) {
            last if ($_ != $tmp++);
            push @products, $product if ($tmp == 10);
        }
    }
}
@_ = sort @products;
$tmp = 1;
my $sum = 0;
foreach(@_) {
    $sum += $_ if ($_ != $tmp);
    $tmp = $_;
}
print $sum."\n";
