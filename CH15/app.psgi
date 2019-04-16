use strict;
use warnings;
use Plack::Builder;
use Data::Dumper;

builder {
    mount '/anne_frank_stamp.jpg' => sub {
        open my $fh, "<:raw", "anne_frank_stamp.jpg" or die $!;
        return [ 200, [ 'Content-Type' => 'image/jpeg' ], $fh ];
    };
    mount '/' => sub {
        my $env = shift;
        return $env->{PATH_INFO} eq '/'
          ? [ 200, [ 'Content-Type' => 'text/html' ], [ get_index() ] ]
          : [ 404, [ 'Content-Type' => 'text/html' ], ['404 Not Found'] ];
    };
    mount '/env' => sub {
        local $Data::Dumper::Indent   = 1;
        local $Data::Dumper::Sortkeys = 1;
        local $Data::Dumper::Terse    = 1;
        my $env = Dumper(shift);

        return [ 200, [ 'Content-Type' => 'text/plain' ], [$env] ];
    };
};

sub get_index {
    return <<'END';
<html>
  <head><title>Sample page</title></head>
  <body>
    <p>Anne Frank was a young lady living in Amsterdam, hiding
    from the Nazis.</p>
    <p>Everyone should read her diaries.</p>
    <img src="/anne_frank_stamp.jpg"/>
  </body>
</html>
END
}
