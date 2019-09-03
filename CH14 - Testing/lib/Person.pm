package Person;
use Moose;
use Moose::Util::TypeConstraints;
use DateTime::Format::Strptime;
use namespace::autoclean;

# Moose doesn't know about non-Moose-based classes.
class_type 'DateTime';

my $datetime_formatter = DateTime::Format::Strptime->new(
    pattern   => '%Y-%m-%d',
    time_zone => 'GMT',
);

coerce 'DateTime' 
  => from 'Str'
  => via { $datetime_formatter->parse_datetime($_) };

use DateTime;

has 'given_name'  => ( is => 'ro', isa => 'Str',      required => 1 );
has 'family_name' => ( is => 'ro', isa => 'Str',      required => 1 );
has 'title'       => ( is => 'rw', isa => 'Str',      required => 0 );
has 'birthdate' =>
  ( is => 'ro', isa => 'DateTime', required => 1, coerce => 1 );

sub name {
    my $self = shift;
    my $name = '';
    if ( my $title = $self->title ) {
        $name = "$title ";
    }
    $name .= join ' ', $self->given_name, $self->family_name;
    return $name;
}

sub age {
    my $self     = shift;
    my $duration = DateTime->now - $self->birthdate;
    return $duration->years;
}

__PACKAGE__->meta->make_immutable;

1;
