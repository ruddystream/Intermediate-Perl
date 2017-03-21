#!/usr/bin/perl

###
# Chapter 10 Exercise 03
# ----------------------
# Using a Schwartzian Transform, read a list of words and sort them in 
# “dictionary order.” Dictionary order ignores all capitalization and 
# internal punctuation. Be sure you don’t mangle the data! If the input 
# includes the Professor and The Skipper, the output should have them listed 
# in that order, with that capitalization.
#

use strict;
use warnings;
use 5.018;

sub normalize_string {
	my $string = shift;
	chomp $string;
	
	# canonicalize to lower case ASCII
	$string =~ tr/A-Z/a-z/;
	
	# remove all non-alphas
	$string =~ tr/a-z//cd;

	return $string;
}

my $text = "text.txt";
open my $FH, "<", "$text";
chomp ( my @strings = <$FH> );
close $FH;

my @sorted = map $_->[0],
	sort { $a->[1] cmp $b->[1] }
	map [ $_, normalize_string($_) ],
	@strings;


print "The sorted list of strings from $text:\n";
foreach ( @sorted ) {
	print "  $_\n";
}

__END__

