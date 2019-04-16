use utf8;
package Rights::Schema::Result::VideoToMedia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Rights::Schema::Result::VideoToMedia

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<video_to_media>

=cut

__PACKAGE__->table("video_to_media");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 video_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 media_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "video_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "media_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 media

Type: belongs_to

Related object: L<Rights::Schema::Result::Media>

=cut

__PACKAGE__->belongs_to(
  "media",
  "Rights::Schema::Result::Media",
  { id => "media_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 video

Type: belongs_to

Related object: L<Rights::Schema::Result::Video>

=cut

__PACKAGE__->belongs_to(
  "video",
  "Rights::Schema::Result::Video",
  { id => "video_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2012-06-13 22:14:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nPXvQr7qaSUpqbnEmowBgA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
