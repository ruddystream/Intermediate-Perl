#!/usr/local/bin/perl

use strict;
use warnings;

# THANK YOU perldoc! :)
use lib "$ENV{HOME}/code/intermediate-perl/chapter-13/Animal/lib";

use Cow;
use Horse;
use Mouse;
use Sheep;

my @animals;

print "Welcome to the Barnyard!\n";

while ( 1 ) {
	print "Your choices are: cow horse mouse sheep\n";
	print "  Please type your choice, or press enter to end: ";

	chomp ( my $choice = <STDIN> );

	last if $choice =~ /\A\z/;

	if ( $choice !~ /\A(cow|horse|mouse|sheep)\z/i ) {
		print "\n -- PLEASE MAKE A CORRECT CHOICE -- \n\n";
	} else {
		$choice = ucfirst( lc ( $choice ) );
		print "\n -- SPAWNING $choice -- \n\n";
		push @animals, $choice;
	}
}

foreach ( @animals ){
	$_->speak();
}
