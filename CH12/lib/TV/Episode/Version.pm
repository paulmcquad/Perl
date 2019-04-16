package TV::Episode::Version;

use strict;
use warnings;
use Carp 'croak';

use base 'TV::Episode';

our $VERSION = '0.01';

sub new {
    my ( $class, $arg_for ) = @_;
    my $self = bless {} => $class;
    $self->_initialize($arg_for);
    return $self;
}

sub _initialize {
    my ( $self, $arg_for ) = @_;
    my %arg_for = %$arg_for;

    $self->{version_description} = delete $arg_for{version_description}
      || 'Original';
    $self->SUPER::_initialize( \%arg_for );
}

sub version_description { shift->{version_description} }

sub as_string {
    my $self      = shift;
    my $as_string = $self->SUPER::as_string;
    $as_string .= sprintf "%-14s - %s\n" => 'Version',
      $self->version_description;
    return $as_string;
}

1;
