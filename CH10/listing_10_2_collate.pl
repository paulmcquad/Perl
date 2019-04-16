use strict;
use warnings;
use diagnostics;

# We do not need to "use utf8" becuase the source code does not have UTF-8
# characters.
#
# We do not need to binmode STDIN because we are not accepting any input.
binmode STDOUT, ':encoding(UTF-8)';

print <<'END';
Note that this program prints out several Unicode characters. If your system
does not have the correct fonts installed, you may get garbage output.

END

use Unicode::Collate;
my @apples = (
    "\N{U+212B}pples",
    "\N{U+00C5}pples",
    "\N{U+0041}\N{U+030A}pples",
    "apples",
    "Apples",
);
my @bad    = sort @apples;
my @sorted = Unicode::Collate->new->sort(@apples);
print "Original: @apples\n";
print "Sorted:   @bad\n";
print "Collated: @sorted\n";
