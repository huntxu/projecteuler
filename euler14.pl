#!/usr/bin/perl -w
#use strict;

sub try {
    my $loop=0;
    my $tmp=$_[0];
    while ($tmp!=1) {
	if (defined($a[$tmp])) {
	    $loop+=$a[$tmp];
	    $tmp=1;
	} else {
	    if($tmp&1) {
		$tmp=$tmp*3+1;
	    } else {
		$tmp /= 2;
	    }
	    $loop++;
	}
    }
    $a[$_[0]] = $loop;
    $loop;
}

my $max=0;
my $i=1;
my $num=0;
my $t=0;

foreach (1..1000000) {
    $t = &try ($_);
    if ($max<$t) {
	$max=$t;
	$num=$_;
    }
}

print "$num\n";
