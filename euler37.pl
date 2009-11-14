#!/usr/bin/perl -w
use strict;

my %primes = (
    '2' => 1,
    '3' => 1,
    '5' => 1,
    '7' => 1,
    '11' => 1,
    '13' => 1,
    '17' => 1,
    '19' => 1,
    '23' => 1,
    '29' => 1,
    '31' => 1,
    '37' => 1,
    '41' => 1,
    '43' => 1,
    '47' => 1,
    '53' => 1,
    '59' => 1,
    '61' => 1,
    '67' => 1,
    '71' => 1,
    '73' => 1,
    '79' => 1,
    '83' => 1,
    '89' => 1,
    '97' => 1,
);
my @primes=(sort {$a<=>$b} keys %primes);
sub isprime {
    my $num = shift;
    my $tmp = int(sqrt($num));
    foreach(@primes) {
        return 0 if ($num % $_ == 0);
        last if ($_>$tmp);
    }
    return 1;
}

sub istruncatable {
    my $num = shift;
    my $tmp = $num;
    foreach(2..length($tmp)) {
        $tmp =~ s/\d(.+)/$1/;
        return 0 unless (exists $primes{$tmp});
    }
    foreach(2..length($num)) {
        $num =~ s/(.+)\d/$1/;
        return 0 unless (exists $primes{$num});
    }
    return 1;
}
my $sum = 0;
my $eleven = 0;
foreach (10..1000000) {
    next if ($_%2 == 0);
    last if ($eleven == 11);
    if (isprime($_)) {
        push @primes, $_;
        $primes{$_} = 1;
        if (istruncatable($_)) {
            $sum += $_;
            $eleven++;
#verbose            print "$eleven $_\n";
        }
    } 
}
print "$sum\n";
