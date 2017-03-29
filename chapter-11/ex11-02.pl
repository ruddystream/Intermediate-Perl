#!/usr/bin/perl

###
# Chapter 11 Exercise 02
# ----------------------
# Make a program that uses your library and the following code to print out 
# a message, such as Today is dip sen 15 2011, meaning that today is a 
# Monday in August. You might use localtime.
#

use strict;
use warnings;

require Oogaboogoo::Date;

# Because I'm forgetful:
#   0    1    2     3     4    5     6     7     8
# ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime;


my ( $date, $month, $year, $day ) = (localtime)[3,4,5,6];
$year += 1900;

my $ooga_day = Oogaboogoo::Date::day( $day );
my $ooga_month = Oogaboogoo::Date::month( $month );

print "Today is $ooga_day $ooga_month $date $year.\n";

__END__

