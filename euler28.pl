#!/usr/bin/perl -w

my $i=1;
my $b;
my $sum=1;
foreach(1..500) {
    $b=$_*2;
    foreach(1..4) {
	$i+=$b;
	$sum+=$i;
    }
}
print $sum."\n";
