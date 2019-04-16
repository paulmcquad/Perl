package Convert::Distance::Imperial;

=head1 NAME

Convert::Distance::Imperial - Convert imperial units to/from other units

=head1 VERSION

VERSION 0.001

=head1 SYNOPSIS

 use Convert::Distance::Imperial 'miles_to_inches';
 my $miles = miles_to_inches(453285);

=head1 DESCRIPTION

This example module shows how to convert to/from miles, yards, feet, and
inches. It's not terribly complete, but it's just to show basic module
structure.

=cut

use strict;
use warnings;
use diagnostics;

our $VERSION = '0.001';
$VERSION = eval $VERSION;

# We're keeping POD sections close to the relevant code to make them easier to
# follow

=head1 EXPORT

The following functions are exported on demand. All functions may be exported
via the ":all" tag.

=over 4

=item * miles_to_yards

=item * yards_to_miles

=item * miles_to_feet

=item * feet_to_miles

=item * miles_to_inches

=item * inches_to_miles

=back

=cut

use Exporter 'import';
our @EXPORT_OK = qw(
  miles_to_yards
  yards_to_miles
  miles_to_feet
  feet_to_miles
  miles_to_inches
  inches_to_miles
);
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

use constant {
    FEET_PER_MILE   => 5_280,
    FEET_PER_YARD   => 3,
    INCHES_PER_FOOT => 12,
};

=head1 SUBROUTINES

=head2 C<miles_to_yards>

 my $yards = miles_to_yards($miles);

Takes a numeric value of miles and returns the number of yards in it.

=cut

sub miles_to_yards {
    my $miles = shift;
    return miles_to_feet($miles) / FEET_PER_YARD;
}

=head2 C<yards_to_miles>

 my $miles = yards_to_miles($yards);

Takes a numeric value of yards and returns the number of miles in it.

=cut

sub yards_to_miles {
    my $yards = shift;

    return feet_to_miles( $yards * FEET_PER_YARD );
}

=head2 C<miles_to_feet>

 my $feet = miles_to_feet($miles);

Takes a numeric value of miles and returns the number of feet in it.

=cut

sub miles_to_feet {
    my $miles = shift;
    return $miles * FEET_PER_MILE;
}

=head2 C<feet_to_miles>

 my $miles = feet_to_miles($feet);

Takes a numeric value of feet and returns the number of miles in it.

=cut

sub feet_to_miles {
    my $feet = shift;
    return $feet / FEET_PER_MILE;
}

=head2 C<miles_to_inches>

 my $inches = miles_to_inches($miles);

Takes a numeric value of miles and returns the number of inches in it.

=cut

sub miles_to_inches {
    my $miles = shift;
    return miles_to_feet($miles) * INCHES_PER_FOOT;
}

=head2 C<inches_to_miles>

 my $miles = inches_to_miles($inches);

Takes a numeric value of inches and returns the number of miles in it.

=cut

sub inches_to_miles {
    my $inches = shift;
    return feet_to_miles( $inches / INCHES_PER_FOOT );
}

1;

__END__

=head1 BUGS

All functions allow negative values and non-numeric values.

=head1 AUTHOR

Curtis "Ovid" Poe

=head1 LICENSE

Copyright (c) 2012 Curtis "Ovid" Poe (ovid@cpan.org). All rights reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
