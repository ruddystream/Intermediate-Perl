#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Mouse' );
}

# check that sound() returns a "squeak" .
like( Mouse->sound(), qr/squeak/, 'Returns a squeak.' );

done_testing();