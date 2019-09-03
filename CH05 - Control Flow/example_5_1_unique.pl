use strict;
use warnings;
use diagnostics;

my @array = ( 3, 4, 1, 4, 7, 7, 4, 1, 3, 8 );
my %unordered;
@unordered{@array} = undef;

foreach my $key ( keys %unordered ) {
    print "Unordered: $key\n";
}

my %seen;
my @ordered;
foreach my $element (@array) {
    if ( not $seen{$element}++ ) {
        push @ordered, $element;
    }
}
foreach my $element (@ordered) {
    print "Ordered: $element\n";
}

print <<'END';

Note that for this code, "Ordered" means "preserving the order the elements
were found in the original array", not in alphabetical or numeric order.
END
