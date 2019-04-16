use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Rights';
use Rights::Controller::Media;

ok( request('/media')->is_success, 'Request should succeed' );
done_testing();
