use strict;
use warnings;
use HTML::SimpleLinkExtor;
use LWP::UserAgent;

my $url = shift @ARGV or die "Hey, gimme a URL!";

my $ua = LWP::UserAgent->new;
$ua->timeout(10);

my $response = $ua->get($url) or die "Could not get '$url'";

unless ( $response->is_success ) {
    die $response->status_line;
}
my $html = $response->decoded_content;

my $extractor = HTML::SimpleLinkExtor->new;
$extractor->parse($html);
my @links = $extractor->links;

unless (@links) {
    print "No links founds for $url\n";
    exit;
}
for my $link ( sort @links ) {
    print "$link\n";
}
