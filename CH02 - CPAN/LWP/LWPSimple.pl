#!/usr/bin/perl

# Output source code of web page to file

print "Content-type: text/html\n\n";

use strict;
use warnings;
use LWP::Simple;

my $res = get("https://www.coder-forge.com/");

open(FILE, ">LWPSimple.txt");
print FILE $res;
close(FILE);
