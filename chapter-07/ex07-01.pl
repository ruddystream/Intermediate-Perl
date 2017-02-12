#!/usr/bin/perl

###
# Chapter 07 Exercise 01
# ----------------------
# The Professor modified some files on Monday afternoon and now he’s 
# forgotten which ones they were. This happens all the time. He wants 
# you to make a subroutine called gather_mtime_between, which, given 
# a starting and ending timestamp, returns a pair of coderefs. The first 
# one will be used with File::Find to gather the names of only the items 
# that were modified between those two times; the second one you can use 
# to get the list of items found.
#

use strict;
use warnings;
use utf8;

use File::Basename;
use File::Find;
use Time::Local;

# wheeee...
sub gather_mtime_between {

	my $start = shift;
	my $stop  = shift;

	my @found = ();

	return (
		# sub 1: gather names that were modified between $start and $stop.
		sub {
			my $modtime = (stat $_)[9];
			unless (defined $modtime) {
      			warn "Can't stat $File::Find::name: $!, skipping\n";
      			return;
		    }
			push @found, $File::Find::name if ( $modtime >= $start && $modtime <= $stop && !/\A\.\.?\z/ );
		},

		# sub 2: return list of all files found in sub 1.
		sub {
			return @found;
		}
	);

}

my $target_dow									= 1;        # Sunday is 0, Monday is 1, ...
my @starting_directories						= ("../chapter-06");

my $seconds_per_day 							= 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) 	= localtime;
my $start 										= timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

while ($dow != $target_dow) {
 	# Back up one day
 	$start -= $seconds_per_day;        # hope no DST! :-)
 	if (--$dow < 0) {
		$dow += 7;
	}
}

my $stop = $start + $seconds_per_day;
my ( $gather, $yield ) = gather_mtime_between( $start, $stop );

find($gather, @starting_directories);

my @files = $yield->(  );

for my $file (@files) {
	my $mtime = (stat $file)[9];        # mtime via slice
	my $basefile = basename( $file );
	my $when  = localtime $mtime;
	print "$when: $basefile\n";
}

__END__
