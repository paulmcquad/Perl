use strict;
use warnings;
use lib 'lib';
use Data::Dumper;
use MyDatabase 'db_handle';

my $dbh = db_handle('rights.db');

my $sql = <<'SQL';
  SELECT id, media_type 
    FROM media_types
ORDER BY id ASC
SQL

my $sth = $dbh->prepare($sql);
$sth->execute;
while ( my @row = $sth->fetchrow_array ) {
    print "$row[0] - $row[1]\n";
}

print "--------------------\n";

$sth->execute;
while ( my $row = $sth->fetchrow_hashref ) {
    print "$row->{id} - $row->{media_type}\n";
}

print "--------------------\n";

$sth->execute;
while ( my $row = $sth->fetchrow_arrayref ) {
    print "$row->[0] - $row->[1]\n";
}

print "--------------------\n";

my $media_types = $dbh->selectall_arrayref($sql);
print Dumper($media_types);

print "--------------------\n";

my $sql = "SELECT id FROM media_types WHERE media_type = ?";
$sth = $dbh->prepare($sql);
$sth->execute('video');
my @row = $sth->fetchrow_array;
print "$row[0]\n";
