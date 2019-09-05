#!/usr/bin/perl

# Extract Links & Images

print "Content-type: text/html\n\n"; 

use LWP::Simple;
use HTML::LinkExtor;

$res = get("https://www.coder-forge.com/");

$LinkExtor = HTML::LinkExtor->new(\&links);

$LinkExtor->parse($res);

sub links
{
    ($tag, %links) = @_;
    if ($tag eq "a") {
        foreach $key (keys %links){
            if ($key eq "href"){
            print "$links{$key}\n";
            } #if
        } #foreach
    } #if
} #sub

print FILE $res;
