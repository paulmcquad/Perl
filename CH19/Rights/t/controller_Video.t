use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Rights';
use Rights::Controller::Video;

ok( request('/video')->is_success, 'Request should succeed' );
done_testing();
