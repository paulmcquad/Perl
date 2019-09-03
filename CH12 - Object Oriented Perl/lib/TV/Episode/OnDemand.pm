package TV::Episode::OnDemand;

use strict;
use warnings;
use Try::Tiny;
use Carp 'croak';
use overload '""' => 'as_string';

use base 'TV::Episode::Version';

sub _initialize {
    my ( $self, $arg_for ) = @_;
    my %arg_for = %$arg_for;
    foreach my $date_type (qw(start_date end_date)) {
        my $date = delete $arg_for{$date_type};

        try {
            $date->isa('DateTime') or die;
        }
        catch {
            croak(
                "TV::Episode::Broadcast requires a DateTime $date_type: $date");
        };
        $self->{$date_type} = $date;
    }
    if ( $self->start_date >= $self->end_date ) {
        croak("Start date must be before end date");
    }
    $self->SUPER::_initialize(\%arg_for);
}

sub start_date { shift->{start_date} }
sub end_date   { shift->{end_date} }

sub as_string {
    my $self       = shift;
    my $episode    = $self->SUPER::as_string;
    my $start_date = $self->start_date;
    my $end_date   = $self->end_date;
    $episode .= sprintf "%-14s - $start_date\n" => 'Start date';
    $episode .= sprintf "%-14s - $end_date\n"   => 'End date';
    $episode .= sprintf "%-14s - %d\n"          => 'Available days',
      $self->available_days;
    return $episode;
}

sub available_days {
    my $self     = shift;
    my $duration = $self->end_date - $self->start_date;
    return $duration->delta_days;
}

1;
