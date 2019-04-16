use strict;
use warnings;
use lib 'lib';

use Shopper::Personal;

my $shopper = Shopper::Personal->new({
    name   => 'aevar',
    budget => 10,
});
$shopper->buy(
    'beer',
    'Ferrari',
    ('coffee')  x 2,
    ('ravioli') x 2,
    'beer',
);

print $shopper->get_invoice;

my $next_shopper = Shopper::Personal->new({
    name  => 'bob',
    limit => 10,
});
