#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Horse' );
}

# check that sound() returns "neigh".
like( Horse->sound(), qr/neigh/, 'Returns a neigh.' );

done_testing();