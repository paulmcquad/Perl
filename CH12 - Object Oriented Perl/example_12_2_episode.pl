use strict;
use warnings;
use DateTime;

use lib 'lib';
use TV::Episode::OnDemand;

my $ondemand = TV::Episode::OnDemand->new(
    {
        series         => 'Firefly',
        director       => 'Allan Kroeker',
        title          => 'Ariel',
        genre          => 'awesome',
        season         => 1,
        episode_number => 9,
        start_date => DateTime->new(
            year  => 2002,
            month => 11,
            day   => 21,
        ),
        end_date => DateTime->new(
            year  => 2002,
            month => 12,
            day   => 12,
        ),
    }
);
print $ondemand;
