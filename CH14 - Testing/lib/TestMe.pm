package TestMe;

use strict;
use warnings;
use Carp 'croak';
use DateTime;
use URI::Encode 'uri_decode';

use Exporter::NoWork;

sub reciprocal {
    my $number = shift;
    unless ($number) {
        croak("Illegal division by zero");
    }
    return 1 / $number;
}

sub order_date {
    my $today = DateTime->now->subtract( days => rand(30) );
    return sprintf "%02d/%02d/%04d" => map { $today->$_ } qw/day month year/;
}

sub unique {
    my @array = @_;
    my %hash = map { $_ => 1 } @array;
    return keys %hash;
}

sub parse_query_string {
    my $query_string = shift;
    my @pairs = split /[&;]/ => $query_string;

    my %values_for;
    foreach my $pair (@pairs) {
        my ( $key, $value ) = split( /=/, $pair );
        $_ = uri_decode($_) for $key, $value;
        $values_for{$key} ||= [];
        push @{ $values_for{$key} } => $value;
    }
    return \%values_for;
}

1;
