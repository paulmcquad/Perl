use strict;
use warnings;

use Text::CSV_XS;
my $csv = Text::CSV_XS->new( { binary => 1, eol => $/ } );

my @input = (
    [ 'Name',              'Age', 'Occupation'        ],
    [ 'John Public',       28,    'Bum'               ],
    [ 'Curtis "Ovid" Poe', 44,    'Software Engineer' ],
    [ 'Contraire, Leïla',  36,    'Political Advisor' ],
    [ 'Alice Baker',       44,    "CEO,\nMegaCorp"    ],
);
foreach my $input (@input) {
    if ( $csv->combine(@$input) ) {
        print $csv->string;
    }
    else {
        printf "combine() failed on argument: %s\n", $csv->error_input;
    }
}
