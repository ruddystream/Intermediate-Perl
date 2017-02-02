#!/usr/bin/perl

###
# Chapter 05 Exercise 03
# ----------------------
# Starting with your data structure from Exercise 2, rewrite the 
# coconet.dat file so that it’s in the same format, but sorted by source 
# machine. Report each destination machine once per source machine along 
# with total bytes transferred. The destination machines should be 
# indented under the source machine name and be sorted by the machine name.
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
	print "$source\n";
	# sort and read the source / destination pairs for each source.
	my $tb = $total_bytes{$source};

	for my $destination (sort { $tb->{$b} <=> $tb->{$a} } keys %{ $tb }) {
		print "  $destination $tb->{$destination}\n";
	}
	print "\n";

}

__END__

