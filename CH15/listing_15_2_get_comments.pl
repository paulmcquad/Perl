use strict;
use warnings;
use HTML::SimpleLinkExtor;
use HTML::TokeParser::Simple;

my $url = shift @ARGV or die "Hey, gimme a URL!";

my $ua = LWP::UserAgent->new;
$ua->timeout(10);

my $response = $ua->get($url) or die "Could not get '$url'";

unless ( $response->is_success ) {
    die $response->status_line;
}
my $html = $response->decoded_content;

my $parser = HTML::TokeParser::Simple->new( \$html );
while ( my $token = $parser->get_token ) {
    next unless $token->is_comment;
    print $token->as_is, "\n";
}
