use strict;
use warnings;
use Benchmark 'timethese';

sub recursive_factorial {
    my $number = shift;
    return 1 if 0 == $number;
    return $number * recursive_factorial( $number - 1 );
}

sub loop_factorial {
    my $number = shift;
    return 1 if 0 == $number or 1 == $number;

    my $total = 1;
    for ( 2 .. $number ) {
        $total *= $_;
    }
    return $total;
}

{
    my %factorial_for;

    sub cached_factorial {
        my $number = shift;

        unless (exists $factorial_for{$number}) { ## no critic 'ProhibitUnlessBlocks.'
            if ( 0 == $number or 1 == $number ) {
                $factorial_for{$number} = 1;
            }
            else {
                my $factorial = 1;
                for ( 2 .. $number ) {
                    $factorial *= $_;
                }
                $factorial_for{$number} = $factorial;
            }
        }
        return $factorial_for{$number};
    }
}

timethese(
    1_000_000,
    {
        'recursive' => sub { recursive_factorial(15) },
        'loop'      => sub { loop_factorial(15) },
        'cached'    => sub { cached_factorial(15) },
    }
);
