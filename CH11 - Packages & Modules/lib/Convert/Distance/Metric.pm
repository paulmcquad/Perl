package Convert::Distance::Metric;

use strict;
use warnings;

our $VERSION = '0.01';
use Exporter 'import';

our @EXPORT_OK = qw(
    kilometers_to_meters
    meters_to_kilometers
);
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

use constant METERS_PER_KILOMETER => 1000;

sub meters_to_kilometers {
    my $meters = shift;
    return $meters / METERS_PER_KILOMETER;
}

sub kilometers_to_meters {
    my $kilometers = shift;
    return $kilometers * METERS_PER_KILOMETER;
}

1;

__END__

=head1 NAME

Convert::Distance::Metric - Convert kilometers to meters and back

=head1 SYNOPSIS

 use Convert::Distance::Metric ":all";
 print kilometers_to_meters(7);
 print meters_to_kilometers(3800);

=head1 DESCRIPTION

This is a simple module to convert kilometers to meters and back. It's mainly
here to show how modules are built and documented.

=head1 EXPORT

The following functions may be exported on demand. You can export all of them
with:

 use Convert::Distance::Metric ':all';

=over 4

=item * C<kilometers_to_meters>

=item * C<meters_to_kilometers>

=back

=head1 FUNCTIONS

=head2 C<kilometers_to_meters>

 my $meters = kilometers_to_meters($kilometers);

This function accepts a number representing kilometers and returns the number
of meters in that number of kilometers.

=head2 C<meters_to_kilometers>

 my $kilometers = meters_to_kilometers($meters);

This function accepts a number representing meters and returns the number
of kilometers in that number of meters.

=head1 BUGS

None known. Report bugs via email to C<me@example.com>.

=head1 SEE ALSO

See the L<Convert::Distance::Imperial> modules for imperial conversions.

=head1 AUTHOR

Curtis "Ovid" Poe C<ovid@cpan.org>

=head1 LICENSE

Copyright 2012 Curtis "Ovid" Poe.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
