use strict;
use warnings;
use diagnostics;

my @name = ('Andrew', 'Andy', 'Kaufman');
my ( $first, $nick, $last ) = @name;
print qq{$first "$nick" $last\n};
