#!/usr/bin/perl

###
# Chapter 05 Exercise 02
# ----------------------
# Modify the code from this chapter that reads coconet.dat, so that each 
# source machine’s portion of the output shows the total bytes from that 
# machine. List the source machines in order from most to least data 
# transferred. Within each group, list the destination machines in order 
# from most to least data transferred to that target from the source 
# machine.
#

use strict;
use warnings;
use v5.10;

my %total_bytes;
my %all_sources;

while (<>) {
	# skip comments
	next if ( /\A#/ );

	# split the line into its constituent parts.
	my ($source, $destination, $bytes) = split;

	# add to the total for source / destination pair.
	$total_bytes{$source}{$destination} += $bytes;

	# add to overall total for source.
	$all_sources{$source} += $bytes;
}

# source and read the all_sources hash.
for my $source ( sort { $all_sources{$b} <=> $all_sources{$a} } keys %all_sources ) {
	print "SOURCE: $source ($all_sources{$source} bytes transferred)\n";
	# sort and read the source / destination pairs for each source.
	my $tb = $total_bytes{$source};

	for my $destination (sort { $tb->{$b} <=> $tb->{$a} } keys %{ $tb }) {
		print "  $source => $destination:",
		      " $tb->{$destination} bytes\n";
	}
	print "\n";

}

__END__

