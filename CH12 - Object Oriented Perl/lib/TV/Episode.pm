package TV::Episode;

use strict;
use warnings;
use Carp 'croak';
use Scalar::Util 'looks_like_number';

our $VERSION = '0.01';

my %IS_ALLOWED_GENRE = map { $_ => 1 } qw(
  comedy
  drama
  documentary
  awesome
);

sub new {
    my ( $class, $arg_for ) = @_;
    my $self = bless {} => $class;
    $self->_initialize($arg_for);
    return $self;
}

sub _initialize {
    my ( $self, $arg_for ) = @_;
    my %arg_for = %$arg_for;

    foreach my $property (qw/series director title/) {
        my $value = delete $arg_for{$property};

        # at least one non-space character
        unless ( defined $value && $value =~ /\S/ ) {
            croak("property '$property' must have at a value");
        }
        $self->{$property} = $value;
    }

    my $genre = delete $arg_for{genre};
    unless ( exists $IS_ALLOWED_GENRE{$genre} ) {
        croak("Genre 'genre' is not an allowed genre");
    }
    $self->{genre} = $genre;

    foreach my $property (qw/season episode_number/) {
        my $value = delete $arg_for{$property};
        unless ( looks_like_number($value) && $value > 0 ) {
            croak("$value must have a positive value");
        }
        $self->{$property} = $value;
    }
    if ( my $extra = join ', ' => keys %arg_for ) {
        croak("Unknown keys to new(): $extra");
    }
}

sub series         { shift->{series} }
sub title          { shift->{title} }
sub director       { shift->{director} }
sub genre          { shift->{genre} }
sub season         { shift->{season} }
sub episode_number { shift->{episode_number} }

sub as_string {
    my $self       = shift;
    my @properties = qw(
      series
      title
      director
      genre
      season
      episode_number
    );

    my $episode = '';
    foreach my $property (@properties) {
        $episode .= sprintf "%-14s - %s\n", ucfirst($property), $self->$property;
    }
    return $episode;
}

1;
