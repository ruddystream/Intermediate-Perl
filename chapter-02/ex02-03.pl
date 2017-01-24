#!/usr/bin/perl

###
# Chapter 02 Exercise 03
# ----------------------
# Parse the International Standard Book Number from the back of this book 
# (9781449393090). Install the Business::ISBN module from CPAN and use it 
# to extract the group code and the publisher code from the number.
#

use strict;
use warnings;
use Business::ISBN;

my $isbn = Business::ISBN->new( '9781449393090' );

print "Information about ISBN " . $isbn->as_string . "\n";
print "      Group Code: " . $isbn->group_code . "\n";
print "  Publisher Code: " . $isbn->publisher_code . "\n";

__END__

