#!/usr/bin/perl

###
# Chapter 08 Exercise 02
# ----------------------
# The Professor has to read a logfile. He wants to write a series of 
# files, called gilligan.info, maryann.info, and so on. Each file should 
# contain all the lines that begin with that name. Now, the logfile is 
# large and the coconut-powered computer is not fast, so he wants to process 
# the input file in one pass and write all output files in parallel. How 
# does he do it?
#

use strict;
use warnings;
use IO::File;
use IO::Scalar;
use v5.10.1;

my $logfile = "logfile.dat";
my $logfile_handle = IO::File->new();
my $logdata;
my $logdata_handle = IO::Scalar->new();

$logfile_handle->open( $logfile ) 
	or die "Could not open $logfile for reading. The error was: $!\n";
{
	local $/;
	$logdata = <$logfile_handle>;
	$logfile_handle->close();
}
$logdata_handle->open( \$logdata );

while ( <$logdata_handle> ) {

	unless (/^([^:]+):/) {
    	warn "ignoring the line with missing name: $_";
    	next;
    }

	state $output_handles;
	my ( $person, $thing ) = split /:/, $_;
	unless ( $output_handles->{$person} ) {
		my $temp_handle = IO::File->new( "$person.info", 'w' );
		$output_handles->{$person} = $temp_handle;
	}
	print {$output_handles->{$person}} $thing;
}

__END__

