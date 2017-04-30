#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Horse' );
}

diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# check that sound() returns "neigh".
like( Horse->sound(), qr/neigh/, 'Returns a neigh.' );
is( Horse->speak(), "The horse goes \"neigh!\"", 'Returns appropriate horse speak' );

done_testing();