use strict;
use warnings;
use autodie ':all';

use File::Spec::Functions qw(catdir splitdir);

# The starting directory wil be passed on the command line.
# Otherwise, use the current directory.
my $dir = @ARGV ? $ARGV[0] : '.';

unless ( -d $dir ) {
    die "($dir) is not a directory";
}

print_entries( $dir, 1 );

exit 0;

sub print_entries {
    my ( $dir, $top_level ) = @_;
    my @dirs = splitdir($dir);
    my $depth = @dirs - 1 unless $top_level;
    $depth ||= 0;
    my $prefix = '|  ' x $depth;
    my $name = $depth ? $dirs[-1] : $dir;
    $name =~ s{/$}{};
    print "$prefix$name\n";

    opendir( my $dh, $dir );

    # grab everything that does not start with a .
    my @entries = sort grep { !/^\./ } readdir($dh);

    foreach my $entry (@entries) {
        my $path = catdir( $dir, $entry );
        if ( -f $path ) {
            print "$prefix|--$entry\n";
        }
        elsif ( -d _ ) {
            print_entries($path);
        }
        else {

            # skip anything not a file or directory
        }
    }
}
