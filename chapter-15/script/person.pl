#!/usr/local/bin/perl

use strict;
use warnings;

# THANK YOU perldoc! :)
use lib "$ENV{HOME}/code/intermediate-perl/chapter-14/Animal/lib";

use Person;

print "Welcome to type and say!\n";

print "What does the person say? (Enter for nothing): ";
chomp( my $utterance = <STDIN> );
if ( $utterance =~ /\A\z/ ) {
	undef $utterance;
	print "nothing it is, then.\n";
}
print Person->speak( $utterance ) . "\n";
