use strict;
use warnings;
use XML::Twig;

my $twig = XML::Twig->new(
    twig_handlers => {
        '//library'            => sub { $_->set_tag('ol') },
        '//library/book'       => sub { $_->set_tag('li'); $_->set_atts( {} ) },
        '//library/book/title' => sub { $_->set_tag('strong') },
        '//library/book/publisher' => sub { $_->delete },
        '//library/book/authors'   => \&rewrite_authors,
    },
    pretty_print => 'indented',
    no_prolog    => 1,
    comments     => 'drop',
);
$twig->parsefile('example_18_4_library.xml');
print $twig->toString;

sub rewrite_authors {
    my $authors = $_;
    my @authors = map { $_->text } $authors->children('author');
    $authors->set_tag('p');
    $authors->set_text( join ' - ', @authors );
}
