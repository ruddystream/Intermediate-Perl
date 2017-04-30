#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

my @array = ( qw( a b c d e ) );

BEGIN {
	use_ok( 'My::List::Util' );
}

# Is shuffle() defined?
ok( defined &My::List::Util::shuffle, 'shuffle() is defined.' );

# Does shuffle... 
# ...return no args on an empty list?
my @shuffled = My::List::Util::shuffle( );
is ( scalar @shuffled, 0, 'no args returns an empty list.' );

# ...return an array of the same size?
my @shuffled = My::List::Util::shuffle( @array );
is ( scalar @array, scalar @shuffled, 'The array returned is the same size as the array passed.' );

# That's enough testing.
done_testing();
