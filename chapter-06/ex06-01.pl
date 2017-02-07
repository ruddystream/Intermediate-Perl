#!/usr/bin/perl

###
# Chapter 06 Exercise 01
# ----------------------
# Use the Storable module to modify the program from Exercise 2 in 
# Chapter 5 needs to keep the running totals in a data file so the 
# Professor can run it on each day’s logs to get the new totals. 
#

use strict;
use warnings;
use Storable qw( retrieve nstore );
use v5.10;

my %total_bytes;
my $all_sources = "ALL_SOURCES";

my $data_store = "total_bytes.dat";

# make sure that supplied log file is readable.
die "Cannot read $ARGV[0]" unless -r $ARGV[0];

# retrieve the date from file.
if ( -e $data_store && -r $data_store ) {
	my $d = retrieve $data_store;
	%total_bytes = %$d;
}

while (<>) {
	# skip comments
	next if ( /\A#/ );

	# split the line into its constituent parts.
	my ($source, $destination, $bytes) = split;

	# add to the total for source / destination pair.
	$total_bytes{$source}{$destination} += $bytes;

	# add to overall total for source.
	$total_bytes{$source}{$all_sources} += $bytes;
}

# save current data out to file.
nstore \%total_bytes, $data_store;

# source and read the all_sources hash.
for my $source ( sort { $total_bytes{$b}{$all_sources} <=> $total_bytes{$a}{$all_sources} } keys %total_bytes ) {
	print "SOURCE: $source ($total_bytes{$source}{$all_sources} bytes transferred)\n";
	# sort and read the source / destination pairs for each source.
	my $tb = $total_bytes{$source};

	for my $destination (sort { $tb->{$b} <=> $tb->{$a} } keys %{ $tb }) {
		next if $destination eq $all_sources;
		print "  $source => $destination:",
		      " $tb->{$destination} bytes\n";
	}
	print "\n";

}

__END__

