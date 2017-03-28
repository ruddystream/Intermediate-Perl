#!/usr/bin/perl

###
# Chapter 10 Exercise 02
# ----------------------
# Read up on the Benchmark module, included with Perl. Write a program that 
# will answer the question, “How much does using the Schwartzian Transform 
# speed up the task of Exercise 1?
#
use strict;
use warnings;
use Data::Dumper;
use Benchmark qw( :all );

chdir '/usr/bin';

my @files = glob '*';
my $native_sort           = sub { my @sorted = sort { -s $a <=> -s $b } glob '*'; };
my $schwartzian_transform = sub { my @sorted_again = map $_->[0], sort { $a->[1] <=> $b->[1] } map [ $_, -s $_ ], glob '*'; };

print "There are " . @files . " files to compare.\n";

my $result = timethese( -5, {
		Naive_Sort => , $native_sort,
		Schwartzian_Transform => $schwartzian_transform
	}
);

print "\n";
cmpthese( $result );


__END__

