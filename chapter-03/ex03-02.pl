#!/usr/bin/perl

###
# Chapter 03 Exercise 02
# ----------------------
# Write a program that asks the user to enter a regular expression. Read 
# this as data from standard input; don’t get it from the command line 
# arguments. Report a list of files in some hardcoded directory whose 
# names match the pattern. Repeat this until the user enters an empty 
# string instead of a pattern.
#

use strict;
use warnings;

my $directory = "/etc";

print "Enter patterns to match filenames in $directory.\n\n";

while ( 1 ) {
	print " Enter a regex: ";

	chomp ( my $regex = <STDIN> );

#	last unless ( defined $regex && length $regex );
	last if $regex =~ /\A\z/;

	my @matching_files = grep { eval { /$regex/ } } glob ( "$directory/*");
	
	if ( $@ ) {
		print "\n   ERROR: $@\n";
	} else {
		if ( $#matching_files < 0 ) {
			print "\n   No files matched /$regex/.\n\n";
		} else {
			print "\n   ", $#matching_files+1, " files matched /$regex/:\n";
			print map { "     $_\n" } @matching_files;
			print "\n";
		}
	}
}

print "\nThanks for playing!\n";
__END__

