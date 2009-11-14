#!/usr/bin/perl -w
#要先sed -r 's/"//g;s/,/\n/g' -i input22 && sort -d input22 > input22...
use strict;

my $line=0;
my $total=0;
my $name;
while (<>) {
    chomp;
    $name=0;
    $line++;
    s/(\w{1})/$1 /g;
    my @char = split;
    foreach (@char) {
	$_=ord($_)-64;
	$name+=$_;
    }
    $total+=$line*$name;
}
print $total."\n";
