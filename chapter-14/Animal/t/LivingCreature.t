#!perl -T

use strict;
use warnings;

use Test::More;

BEGIN {
	use_ok( 'LivingCreature' ) || BAIL_OUT();
}

diag( "Testing LivingCreature $LivingCreature::VERSION, Perl $], $^X" );

# they have to be defined in LivingCreature.pm
ok( defined &LivingCreature::speak, 'LivingCreature::speak is defined.' );
ok( defined &LivingCreature::sound, 'LivingCreature::sound is defined.' );

# check that sound() dies
eval { LivingCreature->sound() } or my $at = $@;
like( $at, qr/You have/, 'sound() dies with a message.' );

done_testing();
