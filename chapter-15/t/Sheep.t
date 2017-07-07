#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Sheep' );
}

diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# check that sound() returns "baa".
like( Sheep->sound(), qr/baa/, 'Returns a baa.' );
is( Sheep->speak(), "The sheep goes \"baaaa!\"", 'Returns appropriate sheep speak' );

done_testing();