package My::Schema::Result::MediaType;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("media_types");
__PACKAGE__->add_columns(qw{id media_type});
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
    media => "My::Schema::Result::Media",
    "media_type_id"
);

1;
