#!/usr/bin/perl

use strict;
use warnings;
 
use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
 
my $jar = HTTP::CookieJar::LWP->new;
my $ua  = LWP::UserAgent->new(
    cookie_jar        => $jar,
    protocols_allowed => ['http', 'https'],
    timeout           => 10,
);
 
$ua->env_proxy;
 
my $response = $ua->get('https://www.coder-forge.com/');
 
if ($response->is_success) {
    print $response->decoded_content;
}
else {
    die $response->status_line;
}

open(FILE, ">LWPUserAgent.txt");
print FILE $response->{_content};
close(FILE);
