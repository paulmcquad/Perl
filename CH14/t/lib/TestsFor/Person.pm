package TestsFor::Person;

use Test::Most;
use base 'TestsFor';
use DateTime;

sub startup : Tests(startup) {
    my $test = shift;
    $test->SUPER::startup;
    my $class = ref $test;
    $class->mk_classdata('default_person');
}

sub setup : Tests(setup) {
    my $test = shift;
    $test->SUPER::setup;
    $test->default_person(
        $test->class_to_test->new(
            given_name  => 'Charles',
            family_name => 'Drew',
            birthdate   => '1904-06-03',
        )
    );
}

sub constructor : Tests(3) {
    my $test = shift;

    my $class = $test->class_to_test;
    can_ok $class, 'new';

    throws_ok { $class->new }
    qr/Attribute.*required/,
      "Creating a $class without proper attributes should fail";

    isa_ok $test->default_person, $class;
}

sub name : Tests(3) {
    my $test   = shift;
    my $person = $test->default_person;

    can_ok $person, 'name';
    is $person->name, 'Charles Drew', 'name() should return the full name';
    $person->title('Dr.');
    is $person->name, 'Dr. Charles Drew',
      '... and it should be correct if we have a title';
}

sub age : Tests(2) {
    my $test = shift;
    my $person = $test->default_person;

    can_ok $person, 'age';
    cmp_ok $person->age, '>', 100,
        'Our default person is more than one hundred years old';
}

1;
