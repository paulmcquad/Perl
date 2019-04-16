use utf8;

package My::Schema::Result::License;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("licenses");
__PACKAGE__->add_columns(qw{ id name allows_commercial });
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
    media => "My::Schema::Result::Media",
    "license_id"
);

1;
