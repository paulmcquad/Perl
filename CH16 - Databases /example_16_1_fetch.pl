use strict;
use warnings;
use lib 'lib';
use Data::Dumper;
use MyDatabase 'db_handle';

my $dbh = db_handle('rights.db');

my $sql = <<'SQL';
  SELECT m.name, location, attribution
    FROM media m
    JOIN media_types mt ON m.media_type_id = mt.id
    JOIN licenses    l  ON m.license_id    = l.id
   WHERE mt.media_type = ?
     AND l.name        = ?
ORDER BY m.name ASC
SQL
my $sth = $dbh->prepare($sql);
$sth->execute('image','Public Domain');

while ( my $media = $sth->fetchrow_hashref ) {
    print <<"END_MEDIA";
Name:        $media->{name}
Location:    $media->{location}
Attribution: $media->{attribution}
END_MEDIA
}
