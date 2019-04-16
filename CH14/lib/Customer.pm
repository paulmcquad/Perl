package Customer;
use Moose;
extends 'Person';
use Carp 'croak';
use namespace::autoclean;

sub BUILD {
    my $self = shift;

    if ( $self->age < 18 ) {
        my $age = $self->age;
        croak("Customers must be 18 years old or older, not $age");
    }
}

__PACKAGE__->meta->make_immutable;

1;
