package My::Schema::Result::Media;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("media");
__PACKAGE__->add_columns(qw{
    id name location source attribution media_type_id license_id
});

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
    license => "My::Schema::Result::License",
    "license_id",
);

__PACKAGE__->belongs_to(
    media_type => "My::Schema::Result::MediaType",
    "media_type_id",
);

1;
__END__
__PACKAGE__->add_columns(
    id =>
      { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    name        => { data_type => "varchar", is_nullable => 0, size => 255 },
    location    => { data_type => "varchar", is_nullable => 0, size => 255 },
    source      => { data_type => "varchar", is_nullable => 0, size => 511 },
    attribution => { data_type => "varchar", is_nullable => 0, size => 255 },
    media_type_id =>
      { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
    license_id =>
      { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

