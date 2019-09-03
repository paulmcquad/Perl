package Rights::Controller::Media;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Rights::Controller::Media - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $media_rs = $c->model('Media::Media')->search(
        {},    # we want all of them
        { order_by => { -desc => 'name' } },
    );
    $c->stash->{template} = 'media/all.tt';
    $c->stash->{media_rs}  = $media_rs;
}


sub media : Path : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $media = $c->model('Media::Media')->find($id);
    $c->stash->{template} = 'media/display.tt';
    $c->stash->{media}    = $media;
}

=head1 AUTHOR

Ovid

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
