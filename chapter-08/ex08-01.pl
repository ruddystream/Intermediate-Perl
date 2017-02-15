#!/usr/bin/perl

###
# Chapter 08 Exercise 01
# ----------------------
# Write a program that prints the today’s date and the day of the week, 
# but allows the user to choose to send the output to a file, a scalar, 
# or both at the same time. No matter which one the user selects, send 
# the output with a single print statement. If the user chooses to send 
# the output to a scalar, at the end of the program print the scalar’s 
# value to standard output.
#

use strict;
no warnings;
use IO::File;
use IO::Scalar;
use IO::Tee;

use v5.10.1;

my $fh;

my $day  = (localtime)[3];
my $year = (localtime)[5]+1900;
my $mon  = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec )[(localtime)[4]];
my $dow  = qw( Sun Mon Tue Wed Thu Fri Sat )[(localtime)[6]];

my $date = "$dow, $day $mon, $year";
my $choice;

my $thedate = '';

print scalar localtime;
die;

print "I WILL OUTPUT THE DATE.\n";
print "But you need to tell me where:\n\n";
print "  1) A file named \"thedate.txt\",\n";
print "  2) A scalar variable named \"\$thedate\", or\n";
print "  3) Both!\n\n";


while ( 1 ) {

	print "CHOOSE WISELY: ";
	chomp ( $choice = <STDIN> );

	given ( $choice ) {
	
		when ( ! /\d/ ) {
            print " THAT ANSWER IS SO BLANTANTLY WRONG IT MAKES ME -SICK-\n";
            next;
        }

		when ( $_ == 1 ) {
			$fh = IO::File->new( 'thedate.txt', 'w' )
				or die "Can't open thedate.txt for writing. Error was $!\n";
			last;
		}
		
		when ( $_ == 2 ) {
			$fh = IO::Scalar->new( \$thedate );
			last;
		}
	
		when ( $_ == 3 ) {
			my $file_fh   = IO::File->new( 'thedate.txt', 'w' ) 
				or die "Can't open thedate.txt for writing. Error was $!\n";
			my $scalar_fh = IO::Scalar->new( \$thedate );
			$fh = IO::Tee->new( $file_fh, $scalar_fh );
			last;
		}

		default {
			print "\nTHAT ANSWER IS INCORRECT.\n";
		}
	}
}

print $fh $date;

print "The contents of \$thedate were ($thedate)\n" if ( $choice == 2 or $choice == 3 ) 
__END__

