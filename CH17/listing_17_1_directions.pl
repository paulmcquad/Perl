use strict;
use warnings;

use WWW::Mechanize;
use HTML::Strip;
use JSON::Any;
use URI::Encode 'uri_encode';
use utf8::all;
use Getopt::Long;
my ( $start, $end );
GetOptions(
    'start=s' => \$start,
    'end=s'   => \$end,
) or die "Could not parse options";

unless ( $start and $end ) {
    die "Both --start and --end arguments must be supplied";
}
if ( @ARGV ) {
    my $args = join ', ', @ARGV;
    die <<"END";
Your \@ARGV contained '$args'. Did you forget to quote something?
--start=$start
--end=$end
END
}

print "Searching for directions from '$start' to '$end'\n";

$start = uri_encode($start);
$end   = uri_encode($end);
my $url   = "http://maps.googleapis.com/maps/api/directions/json";
my $query = "origin=$start&destination=$end&sensor=false";

my $mech = WWW::Mechanize->new;
$mech->get("$url?$query");
my $object = JSON::Any->new->decode( $mech->content );

unless ( 'OK' eq $object->{status} ) {
    die $object->{status};
}
my $route      = $object->{routes}[0];
my $copyrights = $route->{copyrights};
my $warnings   = $route->{warnings};
my $legs       = $route->{legs}[0];         # only take the first
my $distance   = $legs->{distance}{text};
my $duration   = $legs->{duration}{text};

print "$copyrights\nThe trip is $distance long and lasts $duration\n\n";
print join "\n" => @$warnings;
print "\n";

my $strip = HTML::Strip->new;
foreach my $step ( @{ $legs->{steps} } ) {
    my $distance     = $step->{distance}{text};
    my $duration     = $step->{duration}{text};
    my $instructions = $strip->parse( $step->{html_instructions} );
    $strip->eof;
    print "$instructions for $distance ($duration)\n";
}
