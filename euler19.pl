#!/usr/bin/perl -w

my $i=3;
my $n;
my $total=0;
for (1901..2000) {
    $n=$_;
    for (1..12) {
	if ($_==1||$_==3||$_==5||$_==7||$_==8||$_==10||$_==12) {
	    $i+=31;
	} elsif ($_==4||$_==6||$_==9||$_==11) {
	    $i+=30;
	} else {
	    if ($n%4==0) {
		$i+=29;
	    } else {
		$i+=28;
	    }
	}
	if ($i%7==0) {
	    $total++;
	}
    }
}
print $total."\n";
