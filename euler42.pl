#!/usr/bin/perl -w
use strict;

my $total=0;
my $name;
my %hash=("1"=>1,"3"=>3,"6"=>6,"10"=>10,"15"=>15,"21"=>21,"28"=>28,"36"=>36,"45"=>45,"55"=>55,"66"=>66,"78"=>78,"91"=>91,"105"=>105,"120"=>120,"136"=>136,"153"=>153,"171"=>171);
while (<>) {
    chomp;
    $name=0;
    s/(\w{1})/$1 /g;
    foreach (split) {
	$_=ord($_)-64;
	$name+=$_;
    }
    if (exists $hash{$name}) {
	$total++;
    }
}
print $total."\n";

