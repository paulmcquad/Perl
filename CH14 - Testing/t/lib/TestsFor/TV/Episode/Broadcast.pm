package TestsFor::TV::Episode::Broadcast;

use Test::Most;
use DateTime;
use base 'TestsFor::TV::Episode';

sub default_attributes {
    my $test       = shift;
    my %attributes = $test->SUPER::default_attributes;
    $attributes{broadcast_date} = DateTime->new(
        year  => 2002,
        month => 10,
        day   => 8,
    );
    return %attributes;
}

sub attributes : Tests(+2) {
    my $test = shift;
    $test->SUPER::attributes;
}

1;
