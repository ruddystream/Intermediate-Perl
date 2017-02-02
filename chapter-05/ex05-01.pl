#!/usr/bin/perl

###
# Chapter 05 Exercise 01
# ----------------------
# Without running it, can you see what’s wrong with this piece of a program?
#
# ANSWER:
# The curly braces that enclose the hash lists are actually creating an 
# anonymous hash reference. This reference is returned, and we are attempting
# to assign it to a hash. THAT won't work!
#

use strict;
use warnings;

my %passenger_1 = {
  name       => 'Ginger',
  age        => 22,
  occupation => 'Movie Star',
  real_age   => 35,
  hat        => undef,
};

my %passenger_2 = {
  name          => 'Mary Ann',
  age           => 19,
  hat           => 'bonnet',
  favorite_food => 'corn',
};

my @passengers = (\%passenger_1, \%passenger_2);

__END__

