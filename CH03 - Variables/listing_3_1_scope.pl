use strict;
use warnings;
use diagnostics;

BEGIN {
    print <<'END';
This code is deliberately broken. You will see errors about $number and
$reciprocal requiring explicit package names. Comment out the two offending
lines (they're marked in the code) and then this code will work. It's
deliberately done like to ensure that you understand how variable declaration
and scope works.
END
}

my @numbers = ( 1, 2, 3, 4, 5 );
for my $number (@numbers) {
    my $reciprocal = 1 / $number;
    print "The reciprocal of $number is $reciprocal\n";
}

# comment out the following to lines to make this code work
print $number;        # comment out this line
print $reciprocal;    # comment out this line, too
