#!/usr/bin/perl

###
# Chapter 08 Exercise 03
# ----------------------
# Write a program that takes multiple directory names from the command 
# line and then prints out their contents. Use a function that takes a 
# directory handle reference that you made with opendir.
#

use strict;
use warnings;
use IO::Dir;

sub showme_the_directory_contents {
	my $dh = shift;

	foreach my $file ( readdir( $dh ) ) {
		next if ( $file eq '.' or $file eq '..' );
		print "    $file\n";
	}
}

foreach my $dir ( @ARGV ) {
	unless ( -d $dir ) {
		warn "\nWhat're you trying to pull? \n    $dir isn't a directory.\n";
		next;
	}
	my $dir_handle = IO::Dir->new( $dir );

	print "\nContents of $dir:\n";
	
	showme_the_directory_contents( $dir_handle );
}

__END__

