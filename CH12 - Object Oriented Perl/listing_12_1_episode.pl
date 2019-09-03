use strict;
use warnings;

use lib 'lib';
use TV::Episode;

my $episode = TV::Episode->new(
    {   series         => 'Firefly',
        director       => 'Marita Grabiak',
        title          => 'Jaynestown',
        genre          => 'awesome',
        season         => 1,
        episode_number => 7,
    }
);
print $episode->as_string;

