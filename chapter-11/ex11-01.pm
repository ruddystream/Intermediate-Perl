#!/usr/bin/perl

###
# Chapter 11 Exercise 01
# ----------------------
# The Oogaboogoo natives on the island have unusual names for the days and 
# months. Here is some simple but not very well-written code from Gilligan. 
# Fix it up, add a conversion function for the month names, and make the 
# whole thing into a library. For extra credit, add suitable error checking 
# and consider what should be in the documentation.
#

package Oogaboogoo::Date;
use strict;

my @days = qw(ark dip wap sen pop sep kir);
my @months = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub day { 
	my $num = shift; 
	
	die "$num is not a valid day.\n" 
		unless ( $num >= 0 or $num <= 7 );

	if ( $num == 7 ) {
		$num = 0;
	}

	return $days[$num]; 
}

sub month {
	my $num = shift;

	die "$num is not a valid month.\n"
		unless ( $num >= 0 or $num <= 12 );

	return $months[$num];
}

1;
