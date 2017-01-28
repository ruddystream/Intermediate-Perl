#!/usr/bin/perl

###
# Chapter 04 Exercise 02
# ----------------------
# Using the final version of check_required_items, write a subroutine 
# check_items_for_all that takes as its only parameter a reference to a 
# hash whose keys are the people aboard the Minnow and whose corresponding 
# values are array references of the things they intend to bring on board.
#

use strict;
use warnings;

sub check_required_items {
	my $who   = shift;
	my $items = shift;

	my %whose_items = map { $_, 1 } @$items;
	
	my @required = qw(preserver sunscreen water_bottle jacket);
	my @missing = (  );
	
	for my $item (@required) {
		unless ( $whose_items{$item} ) { # not found in list?
			print "  $who is missing a $item.\n";
			push @missing, $item;
		}
	}
	
	if (@missing) {
		print "  Adding ( @missing ) to ( @$items ) for $who.\n";
		push @$items, @missing;
	}
}

sub check_items_for_all {
	my $all_ref = shift;
	my @people = sort keys %$all_ref;

	foreach my $person ( @people ) {
		print "Checking $person:\n";
		check_required_items( $person, $all_ref->{ $person } );
		print "\n";
	}

}

my @skipper   = qw( blue_shirt hat jacket preserver sunscreen );
my @professor = qw( sunscreen water_bottle slide_rule batteries radio );
my @gilligan  = qw( red_shirt hat lucky_socks water_bottle );

my %all = (
	Gilligan  => \@gilligan, 
	Skipper   => \@skipper, 
	Professor => \@professor,
);

check_items_for_all(\%all);

__END__

