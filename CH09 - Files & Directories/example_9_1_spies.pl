use strict;
use warnings;
use diagnostics;

unless (@ARGV) {

    print <<'END';
This program is designed to be called with arguments.  Call it like this:

 perl example_9_1_spies.pl spies1.txt spies2.txt spies3.txt spies4.txt
END
    exit;
}

while (<>) {
    if (/^\s*#/) {
        print;    # keep the comments
        next;
    }
    chomp;
    my ( $name, $description, $number ) = split /\|/, $_;

    if ( defined $name ) {
        printf "$name|%05d|$description\n", $number;
    }
}
