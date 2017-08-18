#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Mouse' );
}

diag( "Testing Mouse $Mouse::VERSION, Perl $], $^X" );

# check that sound() returns a "squeak" .
like( Mouse->sound(), qr/squeak/, 'Returns a squeak.' );
is( Mouse->speak(), "The mouse goes \"squeak!\" (but you can barely hear it!)", 'Returns appropriate mouse speak' );


done_testing();