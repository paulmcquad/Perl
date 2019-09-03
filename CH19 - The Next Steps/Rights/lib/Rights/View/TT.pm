package Rights::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

Rights::View::TT - TT View for Rights

=head1 DESCRIPTION

TT View for Rights.

=head1 SEE ALSO

L<Rights>

=head1 AUTHOR

Ovid

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
