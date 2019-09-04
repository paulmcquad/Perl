#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;

my $res = get("https://www.coder-forge.com/");

open(FILE, ">LWPSimple.txt");
print FILE $res;
close(FILE);
