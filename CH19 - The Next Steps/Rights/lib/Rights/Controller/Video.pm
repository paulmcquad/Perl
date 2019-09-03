package Rights::Controller::Video;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Rights::Controller::Video - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $video_rs = $c->model('Media::Video')->search(
        {},    # we want all of them
        { order_by => { -asc => 'name' } },
    );
    $c->stash->{template} = 'videos/all.tt';
    $c->stash->{video_rs}  = $video_rs;                                                                                                                                             
}

sub video :Path :Args(1) {
    my ( $self, $c, $id ) = @_;

    my $video = $c->model('Media::Video')->find($id);

    $c->stash->{template} = 'videos/display.tt';
    $c->stash->{video}  = $video;                                                                                                                                             
}

=head1 AUTHOR

Ovid

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
