use strict;
use warnings;
use diagnostics;

sub make_fibonnaci {
    my ( $current, $next ) = ( 0, 1 );
    return sub {
        my $fibonacci = $current;
        ( $current, $next ) = ( $next, $current + $next );
        return $fibonacci;
    };
}

my $iterator = make_fibonnaci();

for ( 1 .. 10 ) {
    my $fibonacci = $iterator->();
    print "$fibonacci\n";
}
