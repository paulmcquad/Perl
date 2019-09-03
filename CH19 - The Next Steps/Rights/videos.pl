use strict;
use warnings;
use lib 'lib';
use DBI;

my $dbh = DBI->connect(
    "dbi:SQLite:dbname=rights.db",
    "",    # no username required
    "",    # no password required
    { RaiseError => 1, PrintError => 0, AutoCommit => 1 },
) or die $DBH::errstr;

my $create_videos_table = <<"SQL";
CREATE TABLE IF NOT EXISTS videos (
    id       INTEGER PRIMARY KEY,
    name     VARCHAR(255)  NOT NULL,
    url      VARCHAR(1000) NOT NULL,
    released DATETIME          NULL
);
SQL
$dbh->do($create_videos_table);
my $create_video_to_media_table = <<"SQL";
CREATE TABLE IF NOT EXISTS video_to_media (
    id       INTEGER PRIMARY KEY,
    video_id INTEGER NOT NULL,
    media_id INTEGER NOT NULL,
    FOREIGN KEY (video_id) REFERENCES videos(id)
    FOREIGN KEY (media_id) REFERENCES media(id)
);
SQL
$dbh->do($create_video_to_media_table);
