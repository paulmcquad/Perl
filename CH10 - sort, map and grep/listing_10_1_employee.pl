use strict;
use warnings;
use diagnostics;

my @employees = (
    {
        name     => 'Sally Jones',
        years    => 4,
        payscale => 4,
    },
    {
        name     => 'Abby Hoffman',
        years    => 1,
        payscale => 10,
    },
    {
        name     => 'Jack Johnson',
        years    => 4,
        payscale => 5,
    },
    {
        name     => 'Mr. Magnate',
        years    => 12,
        payscale => 1,
    },
);
@employees =
  sort { 
    $b->{years}    <=> $a->{years} 
    || 
    $a->{payscale} <=> $b->{payscale}
  }
  @employees;
printf "Name         Years Payscale\n";
foreach my $employee (@employees) {
    printf "%-15s %2d       %2d\n" => @{$employee}{qw/name years payscale/};
}
