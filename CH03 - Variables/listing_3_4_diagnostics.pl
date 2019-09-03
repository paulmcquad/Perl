use strict;
use warnings;
use diagnostics;

my $x;

print <<'END';
This code will generate a warning and diagnostics will verbosely explain the
warning. The exact text of that warning will vary depending on your version
of Perl.

END
my $y = $x + 2;
