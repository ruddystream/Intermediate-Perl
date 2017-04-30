#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'Cow' );
}

# check that sound() returns "moo".
like( Cow->sound(), qr/moo/, 'Returns a moo.' );

done_testing();