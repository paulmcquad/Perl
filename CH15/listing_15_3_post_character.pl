use strict;
use warnings;

use WWW::Mechanize;
use HTML::TableExtract;

my $url  = 'http://localhost:5000/';
my $mech = WWW::Mechanize->new;

$mech->get($url);
$mech->follow_link( text_regex => qr/Please click here/ );
$mech->submit_form(
    form_number => 1,
    fields      => {
        name       => 'Bob',
        profession => 'redshirt',
        birthplace => 'mars',
    },
);
my $te = HTML::TableExtract->new;
$te->parse( $mech->content );

foreach my $ts ( $te->tables ) {
    foreach my $row ( $ts->rows ) {
        printf "%-20s - %s\n" => @$row;
    }
}
