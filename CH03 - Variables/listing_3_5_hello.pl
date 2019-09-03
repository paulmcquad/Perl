use strict; # yes, I use these even for short programs
use warnings;

print "Hello, @ARGV";

print <<'END';


    Note: Try running the program as:

       perl listing_3_5_hello.pl John Q. Public

    That will generate more interesting output
END
