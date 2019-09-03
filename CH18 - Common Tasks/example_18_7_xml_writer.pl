use strict;
use warnings;
use XML::Writer;
use XML::Writer::String;

my $output = XML::Writer::String->new;
my $writer = XML::Writer->new(
    OUTPUT      => $output,
    DATA_MODE   => 1,
    DATA_INDENT => 2,
);

my @to_xml = (
    library =>
        [ book  => { isbn => '1118013840' } => 
            [ title => 'Beginning Perl' ],
            [ authors => 
                [ author => 'Curtis "Ovid" Poe' ],
           ],
            [ publisher => 'Wrox' ],
        ],
        [ book => { isbn => '0596526741' } => 
            [ title => 'Perl Hacks' ],
            [ authors =>
                [ author => 'chromatic' ],
                [ author => 'Damian Conway' ],
                [ author => 'Curtis "Ovid" Poe' ],
            ],
            [ publisher => "O'Reilly Media" ],
        ],
);

sub write_element {
    my ( $writer, $element, @next ) = @_;
    my ( $attributes, @elements ) = 'HASH' eq ref $next[0]
        ? @next 
        : ( {}, @next );
    $writer->startTag($element, %$attributes);
    foreach my $next_element (@elements) {        
        ref $next_element
            ? write_element($writer, @$next_element)
            : $writer->characters($next_element);
    }
    $writer->endTag;
}

$writer->xmlDecl;
write_element($writer, @to_xml);
$writer->end;
print $output->value;
