#!/usr/bin/perl

###
# Chapter 03 Exercise 01
# ----------------------
# Write a program that takes a list of filenames on the command line and 
# uses grep to select the ones whose size is less than 1,000 bytes. Use 
# map to transform the strings in this list, putting four space characters 
# in front of each and a newline character after. Print the resulting list.
#

use strict;
use warnings;

die "Please specify at least one filename.\n" if $#ARGV < 0;

print map { "    $_\n"; } grep { -s < 1000 } @ARGV;

__END__

