use strict;
use warnings;
use diagnostics;
use Carp 'croak';

print <<'END';
This code will die with an error similar to "Uncaught exception", along with a
useful diagnostic message.

Note that the exception might be printed before, after, or in the middle of
the list of numbers. That's because STDERR and STDOUT are handled separately
by your operating system and you cannot guarantee that they will be printed in
sequence.

END

my %length_for = (
    SCALAR => sub { return length ${ $_[0] } },
    ARRAY  => sub { return scalar @{ $_[0] } },
    HASH   => \&_hash_length,
);

sub _hash_length { return scalar keys %{ $_[0] } }

sub mylength {
    my $reference = shift;
    my $length    = $length_for{ ref $reference }
      || croak "Don't know how to handle $reference";
    return $length->($reference);
}
my $name    = 'John Q. Public';
my @things  = qw(this that and the other);
my %cheeses = (
    good => 'Havarti',
    bad  => 'Mimolette',
);
print mylength( \$name ),    "\n";
print mylength( \@things ),  "\n";
print mylength( \%cheeses ), "\n";
print mylength($name), "\n";
