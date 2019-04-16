use strict;
use warnings;
use diagnostics;

use lib 'lib'; # tell Perl we'll find modules in lib/
use My::Number::Utilities;

my @numbers = qw( 3 2 39 7919 997 631 200 7919 459 7919 623 997 867 15 );
my @primes  = grep { My::Number::Utilities::is_prime($_) } @numbers;

print join ', ' => sort { $a <=> $b } @primes;
