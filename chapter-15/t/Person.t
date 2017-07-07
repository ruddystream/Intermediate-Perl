#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Person' );
}

diag( "Testing Person $Person::VERSION, Perl $], $^X" );

# check that sound() returns "moo".
like( Person->sound(), qr/hummmm hummm hummmmmm/, 'Returns a hum.' );
is( Person->speak(), "The person goes \"hummmm hummm hummmmmm!\"", 'No speak() argument returns appropriate Person hum.' );
is( Person->speak('hello'), "The person says \"hello\".", 'The person speaks appropriatly when speak() has an argument.' );
done_testing();