use utf8;
package Rights::Schema::Result::Media;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Rights::Schema::Result::Media

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

=head1 TABLE: C<media>

=cut

__PACKAGE__->table("media");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 location

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source

  data_type: 'varchar'
  is_nullable: 0
  size: 511

=head2 attribution

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 media_type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 license_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "location",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source",
  { data_type => "varchar", is_nullable => 0, size => 511 },
  "attribution",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "media_type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "license_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 license

Type: belongs_to

Related object: L<Rights::Schema::Result::License>

=cut

__PACKAGE__->belongs_to(
  "license",
  "Rights::Schema::Result::License",
  { id => "license_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 media_type

Type: belongs_to

Related object: L<Rights::Schema::Result::MediaType>

=cut

__PACKAGE__->belongs_to(
  "media_type",
  "Rights::Schema::Result::MediaType",
  { id => "media_type_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 video_to_medias

Type: has_many

Related object: L<Rights::Schema::Result::VideoToMedia>

=cut

__PACKAGE__->has_many(
  "video_to_medias",
  "Rights::Schema::Result::VideoToMedia",
  { "foreign.media_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2012-06-13 22:14:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lAyzrbq6+ZT2xsyK11JAxA

sub display_name {
    my $self = shift;
    return $self->name;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
