use strict;
use warnings;
use Getopt::Long;
use Template;
use DateTime;
use File::Spec::Functions 'catfile';

my ( $name, $amount, $lang );

my %body_parts = (
    en => [qw/arms legs/],
    fr => [qw/bras jambes/],
    es => [qw/brazos piernas/],
);
my %supported_lang = map { $_ => 1 } keys %body_parts;

my $template = Template->new(
    INCLUDE_PATH => 'templates',
);

GetOptions(
    'name=s'   => \$name,
    'amount=f' => \$amount,
    'lang=s'   => \$lang,
) or die "Bad options";

$lang ||= 'en';

unless ( $name and $amount ) {
    die "You must provide both name and amount";
}

if ( not exists $supported_lang{$lang} ) {
    die "'$lang' is not a supported lang";
}

my $now             = DateTime->now( locale => $lang );
my @things_to_break = @{ $body_parts{$lang} };
my %template_data   = (
    month     => ucfirst( $now->month_name ),
    day       => $now->day,
    year      => $now->year,
    name      => $name,
    body_part => $things_to_break[ rand scalar @things_to_break ],
    amount    => $amount,
);

my $file = catfile( $lang, 'letter.tt2' );
$template->process(
    $file,
    \%template_data,
    undef,
    binmode => ':encoding(UTF8)'
) or die $template->error;
