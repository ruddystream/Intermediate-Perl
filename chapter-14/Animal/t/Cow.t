#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Cow' );
}

diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# check that sound() returns "moo".
like( Cow->sound(), qr/moo/, 'Returns a moo.' );
is( Cow->speak(), "The cow goes \"moo!\"", 'Returns appropriate cow speak.' );
done_testing();