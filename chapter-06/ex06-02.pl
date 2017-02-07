#!/usr/bin/perl

###
# Chapter 06 Exercise 02
# ----------------------
# Modify the program from Exercise 1 to use JSON instead of Storable. 
#

use strict;
use warnings;
use JSON;
use v5.10;

my %total_bytes;
my $all_sources = "ALL_SOURCES";

my $data_store = "total_bytes.json";
my $ds_outhandle;
my $ds_inhandle;

# make sure that supplied log file is readable.
die "Cannot read $ARGV[0].\n" unless -e $ARGV[0];

# retrieve the date from file.
if ( -e $data_store && -r $data_store ) {
	open ( $ds_inhandle, "<:encoding(UTF-8)", $data_store ) 
		or die "Cannot open $data_store for reading.\n";

	chomp ( my $d = <$ds_inhandle> );

	%total_bytes = %{ decode_json( $d ) };
	close ( $ds_inhandle );
}

open ( $ds_outhandle, ">", $data_store )
	or die "Cannot open $data_store for writing.\n";

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
#print $ds_outhandle to_json( \%total_bytes, { pretty => 1 } );
print $ds_outhandle to_json( \%total_bytes );

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

