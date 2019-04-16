use strict;
use warnings;
use diagnostics;

my %color_for = (
    bananas => 'yellow',
    apples  => 'red',
    oranges => 'orange',
);
for my $fruit (keys %color_for) {
    my $color = $color_for{$fruit};
    print "$fruit are $color\n";
}
