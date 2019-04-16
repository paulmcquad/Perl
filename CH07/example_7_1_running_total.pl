use strict;
use warnings;
use diagnostics;

BEGIN {
    if ( $^V < 5.010 ) {
        print <<'END'
This code uses Perl version 5.10 or above. If you have an older version of
Perl, read the comments in the source code to understand how to get this code
to run.
END
    }
}

use 5.010;

my @numbers = (
    [ 3, 1, 4, 9, 32 ],    # total 49
    [ 5, 200 ],            # total 205
    [ 22, 75, 100, -3 ],   # total 194
);
foreach my $group (@numbers) {
    my ( $total, $running_total ) = _running_total($group);
    print "Total is $total and running total is $running_total\n";
}

sub _running_total {
    state $running_total = 0;
    my $numbers = shift;
    my $total   = 0;
    $total += $_ for @$numbers;
    $running_total += $total;
    return $total, $running_total;
}

# Uncomment the following lines of code if you are running a version of Perl
# less than 5.10, or if you just want to see this in action. Make sure to
# comment out (or delete) the _running_total() subroutine that uses the
# 'state' variable

# {
#     my $running_total = 0;
#     sub _running_total {
#         my $numbers = shift;
#         my $total   = 0;
#         $total += $_ for @$numbers;
#         $running_total += $total;
#         return $total, $running_total;
#     }
# }
