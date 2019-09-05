#!/usr/bin/perl

# Fetch,Parse & Convert a Web Page to Text

print "Content-type: text/html\n\n";

use LWP::Simple;
use HTML::TreeBuilder;
use HTML::FormatText;

my $res = get("https://www.coder-forge.com/");

$formatter = HTML::FormatText->new(leftmargin => 0, rightmargin => 50);

$TreeBuilder = HTML::TreeBuilder->new;
$TreeBuilder->parse($res);

$parse = $formatter->format($TreeBuilder);

# Uncomment command below to output to screen
# print "$parse";
open(FILE, ">LWPSimple2.txt");
print FILE "$parse";
close(FILE);
