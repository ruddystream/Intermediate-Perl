#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

BEGIN {
	use_ok( 'My::List::Util' );
}

# Is sum() defined?
ok( defined &My::List::Util::sum, 'sum() is defined.' );

## Does sum properly... 
# ...sum?
is( My::List::Util::sum( 1,2,3 ), 6, '1+2+3 is 6.' );

# ...sum decimals?
is ( My::List::Util::sum( 1.23,4.56 ), 5.79, '1.23+4.56 is 5.79.' );

# ...sum a list of strings?
is ( My::List::Util::sum( qw( 1 2 3 ) ), 6, '1+2+3 as strings is 6.' );

# ...sum a negative?
is ( My::List::Util::sum( 1,2,-9,3 ), -3, '1+2-9+3 is -3.' );

# ...sum a single number?
is ( My::List::Util::sum( 3 ), 3, '3 alone is 3.' );

# ...sum a mixed list?
is ( My::List::Util::sum( qw( 1 a b 2 ) ), 3, '1+a+b+2 sums the numbers in a mixed list.' );

# ...return undef on bad args?
is ( My::List::Util::sum( qw( a b c d ) ), undef, 'a+b+c+d is undef.' );

# ...return undef on no args?
is ( My::List::Util::sum( ), undef, 'no args is undef.' );

# That's enough testing.
done_testing();
