use strict;
use warnings;

my $number = 0; # a deliberately false value

while ($number > 0) {
    print "You should never see this\n";
}
do {
    print "Unfortunately, you do see this\n";
} while $number > 0;
