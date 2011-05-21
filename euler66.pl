#!/usr/bin/perl -w
use strict;
use bigint;

my ($ans, $result)=(0, 0);
my ($n, $a, $t, $b, $flag);
my ($kkk, $kk, $k, $hhh, $hh, $h);

foreach (1..1000) {
    $n = int(sqrt($_));
    next if ($n**2==$_);
    ($a, $t, $b, $flag) = ($n, $n, 1, 1);
    ($kkk, $kk, $hhh, $hh) = (1, 0, 0, 1);
    while ($flag) {
        $k = $kkk+$t*$kk;
        $h = $hhh+$t*$hh;
        if ($h**2-$_*$k**2==1) {
            $flag = 0;
            #print $h**2 ."-". $_ ."*". $k**2 ."=1\n";
        }
        ($kkk, $kk, $hhh, $hh) = ($kk, $k, $hh, $h);
        $t = int($b*($n+$a)/($_-$a**2));
        $b = ($_-$a*$a)/$b;
        $a = int(($n+$a)/$b)*$b-$a;
    }
    if ($result<$h) {
        $result = $h;
        $ans = $_;
    }
}

print "$ans $result\n";
