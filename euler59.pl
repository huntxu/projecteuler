#!/usr/bin/perl -w
use strict;

my $sum = 0;
my @a;
my @b;
my @c;
while (<>) {
    chomp;
    my @cipher = split(/,/);
    my $num = @cipher;
    while ($num >= 0) {
        push @a, (shift @cipher) if $num>0;
        push @b, (shift @cipher) if $num>1;
        push @c, (shift @cipher) if $num>2;
        $num -= 3;
    }
}
my $flag;
my $t;
my $r;
foreach (97..122) {
    $flag = 0;
    $t = $_;
    foreach (@a) {
        $r = $t^$_;
        if (!($r>=65 && $r<=90) && !($r>=97 && $r<=122)
            && $r != 40
            && $r != 41
            && !($r>=48 && $r<=57)
            && $r != 44
            && $r != 46
            && $r != 59
            && $r != 32
            && $r != 39
            && $r != 63
            && $r != 33
            ) {
                $flag = 1;
                last;
        }
    }
    if (!$flag) {
        foreach (@a) {
            $sum += $_^$t;
        }
    }
}
foreach (97..122) {
    $flag = 0;
    $t = $_;
    foreach (@b) {
        $r = $t^$_;
        if (!($r>=65 && $r<=90) && !($r>=97 && $r<=122)
            && $r != 40
            && $r != 41
            && !($r>=48 && $r<=57)
            && $r != 44
            && $r != 46
            && $r != 59
            && $r != 32
            && $r != 39
            && $r != 63
            && $r != 33
            ) {
                $flag = 1;
                last;
        }
    }
    if (!$flag) {
        foreach (@b) {
            $sum += $_^$t;
        }
    }
}
foreach (97..122) {
    $flag = 0;
    $t = $_;
    foreach (@c) {
        $r = $t^$_;
        if (!($r>=65 && $r<=90) && !($r>=97 && $r<=122)
            && $r != 40
            && $r != 41
            && !($r>=48 && $r<=57)
            && $r != 44
            && $r != 46
            && $r != 59
            && $r != 32
            && $r != 39
            && $r != 63
            && $r != 33
            ) {
                $flag = 1;
                last;
        }
    }
    if (!$flag) {
        foreach (@c) {
            $sum += $_^$t;
        }
    }
}
print "$sum\n";

# 最终文本包括: 大小写字符(65-90, 97-122), 左右括号(40-41), 数字(48-57)
# 分号(59), 逗号(44), 句号(46), 空格(32), 所有格符号(39)
# 感叹号(33), 问号(63)
# passwd: god.
#(The Gospel of John, chapter 1) 1 In the beginning the Word already existed. He was with God, and he was God. 2 He was in the beginning with God. 3 He created everything there is. Nothing exists that he didn't make. 4 Life itself was in him, and this life gives light to everyone. 5 The light shines through the darkness, and the darkness can never extinguish it. 6 God sent John the Baptist 7 to tell everyone about the light so that everyone might believe because of his testimony. 8 John himself was not the light; he was only a witness to the light. 9 The one who is the true light, who gives light to everyone, was going to come into the world. 10 But although the world was made through him, the world didn't recognize him when he came. 11 Even in his own land and among his own people, he was not accepted. 12 But to all who believed him and accepted him, he gave the right to become children of God. 13 They are reborn! This is not a physical birth resulting from human passion or plan, this rebirth comes from God.14 So the Word became human and lived here on earth among us. He was full of unfailing love and faithfulness. And we have seen his glory, the glory of the only Son of the Father.od
