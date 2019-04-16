use strict;
use warnings;

use Rights;

my $app = Rights->apply_default_middlewares(Rights->psgi_app);
$app;

