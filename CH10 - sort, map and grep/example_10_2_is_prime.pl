use strict;
use warnings;
use diagnostics;
use List::MoreUtils 'uniq';
use Time::HiRes qw(gettimeofday tv_interval);
use Memoize 'memoize';

print <<'END';
In the code, change the value of $slow to 1 to see how slow the program is if
you don't use Memoize to cache the values of the prime numbers.

Please wait ...

END
my $slow = 0;   # change this to 1 to see how slow this is without memoize
my @numbers = qw( 3 2 39 7919 997 631 200 7919 459 7919 623 997 867 15 );
@numbers = (@numbers) x 200000;

my @primes;
my $start = [gettimeofday];
if ( $slow ) {
   @primes = grep { is_prime($_) } @numbers;
}
else {
   my %is_prime;
   @primes = grep { 
                ( exists $is_prime{$_} and $is_prime{$_} )
                or 
                ( $is_prime{$_} = is_prime($_) )
             } @numbers;
}
my $elapsed = tv_interval($start);
printf "We took %0.1f seconds to find the primes\n", $elapsed;

print join ', ' => sort { $a <=> $b } uniq @primes;

sub is_prime {
    my $number = $_[0];
    return   if $number < 2;
    return 1 if $number == 2;
    for ( 2 .. int sqrt($number) ) {
        return if !($number % $_);
    }
    return 1;
}
