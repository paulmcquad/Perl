use strict;
use warnings;
use DateTime;
use Getopt::Long;

my $SPACES_PER_DAY = 3;

my $now   = DateTime->now;
my $year  = $now->year;
my $month = $now->month;
GetOptions(
    'month=i' => \$month,
    'year=i'  => \$year,
) or die "Bad options";

my @header = qw( S M T W T F S );
my %date   = (
    month => $month,
    year  => $year,
    day   => 1,
);
my $date        = DateTime->new(%date);
my $last_day    = DateTime->last_day_of_month(%date)->day;
my $day_of_week = $date->day_of_week;
my $month_name  = $date->month_name;

my ( $start, $end ) = ( 1, $last_day );

# if the day_of_week is 7, we'd wind up with 7 days of padding
# and a blank line between the title and the calendar
my @null_days = $day_of_week == 7 ? () : ("") x $day_of_week;

# The undef is there because we want to calculate the newline
# on the calendar based on every 7th day. Since array indices
# start at zero, we'd have an off-by-one error.
my @calendar = ( undef, @header, @null_days, 1 .. $last_day );

# center the title
print centered_title( $month_name, $year );
for my $i ( 1 .. $#calendar ) {
    printf "%${SPACES_PER_DAY}s" => $calendar[$i];
    print "\n" if !( $i % 7 );
}

sub centered_title {
    my ( $month_name, $year ) = @_;
    my $title = "$month_name, $year";
    my $padding = " " x ( ( $SPACES_PER_DAY * 7 - length($title) ) / 2 );
    return " $padding$title\n";
}

__END__

=head1 NAME

listing_18_1_cal.pl - print a calendar for a given month and year

=head1 DESCRIPTION

Quite often we need to quickly display a calendar for a given month and year.
This program will do this for you:

 perl listing_18_1_cal.pl --month 6 --year 2012
 perl listing_18_1_cal.pl -m 6 -y 2012

      June, 2012
  S  M  T  W  T  F  S
                 1  2
  3  4  5  6  7  8  9
 10 11 12 13 14 15 16
 17 18 19 20 21 22 23
 24 25 26 27 28 29 30

=head1 OPTIONS

 --month,-m  The number of the month (defaults to current month)
 --year,-y   The number of the year (defaults to current year)

=head1 EXAMPLES

Current month and year:

 perl listing_18_1_cal.pl 

Current month, different year:

 perl listing_18_1_cal.pl --year 1999
 perl listing_18_1_cal.pl -y 1999

Current year, different month:

 perl listing_18_1_cal.pl --month 1
 perl listing_18_1_cal.pl -m 1

Exact month and year:

 perl listing_18_1_cal.pl --month 12 --year 1999
 perl listing_18_1_cal.pl -m 12 -y 1999
