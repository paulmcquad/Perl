use strict;
use warnings;
use Data::Dumper;

use Capture::Tiny 'capture';
my $program = "$^X example_17_1_poets.pl";
my ( $stdout, $stderr, @result ) = capture { qx"$program" };
print Dumper $stdout, $stderr, \@result;
