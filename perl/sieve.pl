#!/usr/bin/perl

use strict;
use warnings;

sub sieve {
    my $n = shift;
    my @nums;

    for my $i (0 .. $n) {
        $nums[$i] = $i;
    }

    for (my $i = 3; $i <= int(sqrt($n)); $i = $i + 2) {
        next unless $nums[$i];
        
        for (my $j = $i * $i; $j <= $n; $j = $j + $i * 2) {
            $nums[$j] = 0;
        }
    }

    return grep { $_ != 0 && $_ % 2 != 0; } @nums;
}

my $n = <STDIN>;
chomp($n);

my @primes = sieve(int($n));
print $#primes + 1, " ", $primes[$#primes], "\n";
