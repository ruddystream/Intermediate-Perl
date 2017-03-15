#!/usr/bin/perl

###
# Chapter 10 Exercise 01
# ----------------------
# Using the glob operator, a naïve sort of every name in your home directory 
# by their relative sizes might be written as:
#
#	chdir;  # the default is our home directory
#	my @sorted = sort { −s $a <=> −s $b } glob '*';
#
# Rewrite this using the Schwartzian Transform technique.
#
use strict;
use warnings;
use Data::Dumper;

chdir;

my @sorted = sort { -s $a <=> -s $b } glob '*'
print "SORTED:\n";
print Dumper( @sorted );

my @sorted_again = 
	map $_->[0],
	sort { $a->[1] <=> $b->[1] }
	map [ $_, -s $_ ],
	glob '*';
print "SORTED AGAIN:\n";
print Dumper( @sorted_again );

__END__

