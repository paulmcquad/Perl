package Shopper::Personal;
use strict;
use warnings;
use Carp qw(croak carp);
use Scalar::Util 'looks_like_number';

our $VERSION = '0.01';

sub new {
    my ( $class, $arg_for ) = @_;
    my $self = bless {}, $class;
    $self->_initialize(%$arg_for);
    return $self;
}

sub _initialize {
    my ( $self, %arg_for ) = @_;
    my $class = ref $self;

    $self->{purchased_items} = [];
    $self->{money_spent}     = 0;

    my $name = delete $arg_for{name};
    unless ( defined $name ) {
        croak("$class requires a name to be set");
    }

    $self->set_budget( delete $arg_for{budget} );

    $self->{attributes}{name} = $name;

    if ( my $remaining = join ', ', keys %arg_for ) {
        croak("Unknown keys to $class\::new: $remaining");
    }
}

sub get_name {
    my $self = shift;
    return $self->{attributes}{name};
}

sub set_budget {
    my ( $self, $budget ) = @_;
    unless ( looks_like_number($budget) && $budget > 0 ) {
        croak("Budget must be a number greater than zero");
    }
    $self->{attributes}{budget} = $budget;
}

sub get_budget {
    my $self = shift;
    return $self->{attributes}{budget};
}

sub get_invoice {
    my $self        = shift;
    my @items       = $self->_purchased_items;
    my $money_spent = $self->_money_spent;
    my $shopper     = $self->get_name;
    my $date        = localtime;
    unless (@items) {
        return "No items purchased";
    }
    my $invoice =<<"END_HEADER";
Date:    $date
Shopper: $shopper

Item       Cost
END_HEADER
    foreach my $item (@items) {
        $invoice .= sprintf "%-10s %0.2f\n", $item, $self->_find_cost_of($item);
    }
    $invoice .= "\nTotal + 10%: $money_spent\n";
    return $invoice;
}

sub buy {
    my ( $self, @list_of_things_to_buy ) = @_;
    my $remaining_budget = $self->get_budget;
    my $name             = $self->get_name;

    foreach my $item (@list_of_things_to_buy) {
        my $cost = $self->_find_cost_of($item);

        if ( not defined $cost ) {
            carp("$name doesn't know how to buy '$item'");
        }
        elsif ( $cost > $remaining_budget ) {
            carp("$name doesn't have enough money buy '$item'");
        }
        else {
            $remaining_budget -= $cost;
            $self->_buy_item($item);
        }
    }
}

sub _purchased_items { @{ shift->{purchased_items} } }

sub _money_spent {
    my $self = shift;

    # we assume personal shoppers add 10% to the price to cover the cost of
    # their services
    return $self->{money_spent} * 1.10;
}

sub _find_cost_of {
    my ( $class, $item ) = @_;
    my %price_of = (
        beer    => 1,
        coffee  => 3.5,
        ravioli => 1.5,
        ferrari => 225_000,
    );
    return $price_of{lc $item};
}

sub _buy_item {
    my ( $self, $item ) = @_;
    $self->{money_spent} += $self->_find_cost_of($item);
    push @{ $self->{purchased_items} }, $item;
}

1;
