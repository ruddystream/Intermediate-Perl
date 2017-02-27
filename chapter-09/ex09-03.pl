#!/usr/bin/perl

###
# Chapter 09 Exercise 02
# ----------------------
# Modify the program from Exercise 2 to use Regexp::Assemble so you have 
# one pattern instead of an array of patterns.
#



use strict;
use warnings;
use IO::File;
use Regexp::Assemble;

use v5.12;

my $regexfile = "regexes.dat";
my $regexfile_handle = IO::File->new;
my $assembled_regex = Regexp::Assemble->new;

$regexfile_handle->open( $regexfile )
	or die "Couldn't open $regexfile for reading. \n$!.\n";

foreach ( <$regexfile_handle> ) {
	chomp;
	my $re = eval { qr/$_/ }
		or do { warn "Invalid pattern: $@"; next };
	$assembled_regex->add( $re );
}

$regexfile_handle->close() 
	or die "Couldn't close $regexfile.\n$!.\n";

print "ENTER LINES OF INPUT. Carriage return quits.\n";

while ( 1 ) {
	print ":: ";
	chomp ( my $string = <STDIN> );

	last 						if $string =~ /\A\z/;
	say "Match - $string, $."	if $string =~ $assembled_regex;
}

print "GOODBYE.\n";
__END__

