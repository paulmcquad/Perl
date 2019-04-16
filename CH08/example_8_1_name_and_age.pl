use strict;
use warnings;
use diagnostics;

# See also, the data_structure.pl program with this chapter

use Data::Dumper;

my $text = <<'END';
Name: Alice Allison Age: 23
Occupation: Spy
Name: Bob Barkely   Age: 45
Occupation: Fry Cook
Name: Carol Carson  Age: 44
Occupation: Manager
Name: Prince        Age: 53
Occupation: World Class Musician
END

my %age_for;
while ( $text =~ m<Name:\s+([[:alpha:] ]+?)\s+Age:\s+(\d+)>g ) {
    $age_for{$1} = $2;
}
print Dumper( \%age_for );
