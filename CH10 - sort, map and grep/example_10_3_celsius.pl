use strict;
use warnings;

# This is used to print the UTF-8 value of the degrees symbol (U+00B0)
binmode STDOUT, ':encoding(UTF-8)';

my %fahrenheit = (
    'absolute zero'    => -459.67,
    'freezing water'   => 32,
    'body temperature' => 98.6,
    'boiling water'    => 212,
);
my %celsius =
  map { $_ => 5 / 9 * ( $fahrenheit{$_} - 32 )  }
  keys %fahrenheit;
while ( my ( $name, $temp ) = each %celsius ) {
    print "The temperature for $name is $temp\N{U+00B0} celsius\n";
}
