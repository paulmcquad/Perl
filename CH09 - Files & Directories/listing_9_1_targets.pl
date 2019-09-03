use strict;
use warnings;
use diagnostics;

my $filename = shift @ARGV || 'targets.txt';
open my $spies_to_espy, '<', $filename
  or die <<"DIE";
Cannot open '$filename' for writing: $!

Be aware of where you're running your program from. The \$filename variable
needs to have the path to the targets.txt file *relative* to where you are
running the program from. Thus, if the targets.txt file is in the
book/chapter9/targets.txt directory and you're running $0 from the book/
directory, than \$filename should be chapter9/targets.txt.

As a convenience, you may pass the path of targets.txt as an argument to this
program:

 perl $0 path/to/targets.txt
DIE

while ( my $line = <$spies_to_espy> ) {
    next if $line =~ /^\s*#/;    # skip comments!
    chomp($line);
    my ( $name, $case_number, $description ) = split /\|/, $line;
    print "$name ($case_number): $description\n";
}
close $spies_to_espy or die "Could not close '$filename': $!";
