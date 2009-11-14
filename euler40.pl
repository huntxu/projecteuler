#!/usr/bin/perl -w
use strict;

my $loop=0;
my $times=0;
for (1..1000000) {
    if ($_>=100000) {
	$loop+=6;
    } elsif ($_>=10000) {	
	$loop+=5;
    } elsif ($_>=1000) {
	$loop+=4;
    } elsif ($_>=100) {
	$loop+=3;
    } elsif ($_>=10) {
	$loop+=2;
    } else {
	$loop+=1;
    }
    if($loop>=10**$times) {
	print $_." ".$loop." ".$times."\n";
	$times++;
    }
}
