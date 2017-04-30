#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Sheep' );
}

# check that sound() returns "baa".
like( Sheep->sound(), qr/baa/, 'Returns a baa.' );

done_testing();