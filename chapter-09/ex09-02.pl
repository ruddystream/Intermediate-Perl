#!/usr/bin/perl

###
# Chapter 09 Exercise 02
# ----------------------
# Write a program to read in a list of patterns from a file. Precompile 
# the patterns and store them in an array. Prompt the user for lines of 
# input, printing the line number and text for each line that matches. 
# The $. variable is useful here.
#



use strict;
use warnings;
use IO::File;

use v5.12;

my $regexfile = "regexes.dat";
my $regexfile_handle = IO::File->new();
my @regexes = ();

$regexfile_handle->open( $regexfile )
	or die "Couldn't open $regexfile for reading. \n$!.\n";

foreach ( <$regexfile_handle> ) {
	chomp;
	my $re = eval { qr/$_/ }
		or do { warn "Invalid pattern: $@"; next };
	push @regexes, $re;
}

$regexfile_handle->close() 
	or die "Couldn't close $regexfile.\n$!.\n";

print "ENTER LINES OF INPUT. Carriage return quits.\n";

LINE: while ( 1 ) {
	print ":: ";
	chomp ( my $string = <STDIN> );

	last if $string =~ /\A\z/;

	foreach my $regex ( @regexes ) {
		if( $string ~~ $regex ) {
			say "Match - $string, $.";
			next LINE;
		}
	}
}

print "GOODBYE.\n";
__END__

