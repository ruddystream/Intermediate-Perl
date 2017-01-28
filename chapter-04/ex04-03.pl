#!/usr/bin/perl

###
# Chapter 04 Exercise 03
# ----------------------
# Modify the crew roster program to add a location field for each castaway. 
# At the start, set each person’s location to “The Island.” After you’ve 
# added that field to each person’s hash, change the Howells’ locations 
# to “The Island Country Club.” Make a report of everyone’s location.
#

use strict;
use warnings;

sub add_location_field {
	my $person_info_ref = shift;
	if ( $person_info_ref->{'name'} =~ /Howell/ ) {
		$person_info_ref->{'location'} = 'The Island Country Club';
	} else {
		$person_info_ref->{'location'} = 'The Island';
	}
}

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
);
my %thurston_info = (
	name     => 'Thurston Howell',
	hat      => 'Straw',
	shirt    => 'White',
	position => 'Millionaire'
);
my %lovey_info = (
	name     => 'Lovey Howell',
	hat      => 'Green and Red', 
	shirt    => 'White',
	position => 'Millionaire\'s Wife'
);

my @crew = (\%gilligan_info, \%skipper_info, \%thurston_info, \%lovey_info);

my $format = "%-15s %-7s %-15s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}

print "\n";

foreach my $crewmember (@crew) {
	add_location_field( $crewmember );
	
	printf $crewmember->{'name'} . " at " . $crewmember->{'location'} . "\n";
}

__END__

