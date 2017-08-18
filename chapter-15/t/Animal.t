#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Animal' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# they have to be defined in Animal.pm
ok( defined &Animal::speak, 'Animal::speak is defined.' );
ok( defined &Animal::sound, 'Animal::sound is defined.' );

# check that sound() dies
eval { Animal->sound() } or my $at = $@;
like( $at, qr/You have/, 'sound() dies with a message.' );

# check that speak() dies too
eval { Animal->speak() } or $at = $@;
like( $at, qr/You have/, 'speak() dies with a message.' );

{
	package Foofle;
	use parent qw(Animal);
	sub sound { 'foof' }
	Test::More::is(
		Foofle->speak,
		"The foofle goes \"foof!\"",
		'An Animal subclass makes the appropriate sound.'
	);

	eval { Foofle->speak('not foof') } or my $at = $@;
	Test::More::like(
		$at,
		qr/A foofle can't TALK!/,
		'An Animal subclass dies when it tries to speak.'
	);
}

done_testing();
