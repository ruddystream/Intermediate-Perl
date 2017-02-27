#!/usr/bin/perl

###
# Chapter 09 Exercise 01
# ----------------------
# Get the rightmost program running. Once you have the example working, 
# modify the right most program, take a hash reference of patterns, and 
# return the key of the rightmost match.
#

use strict;
use warnings;
use utf8;

use v5.12;

my %patterns = (
  Gilligan   => qr/(?:Wiley )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
);

my $string = 'There is Mrs. Howell, Ginger, and Gilligan, The Professor, and Mary-Ann.';

my $position = original_rightmost( 
  $string,
  @patterns{ sort keys %patterns }
);	

my $person = rightmost( 
	$string,
	\%patterns
);

print "$person is the rightmost match at character $position.\n";
	
sub rightmost {
	my $string = shift;
	my $patterns_ref = shift;

	my $rightmost = -1;
	my $rightmost_key = "";

	while( my( $key, $pattern ) = each %{$patterns_ref} ) {
		my $position = $string =~ m/$pattern/ ? $-[0] : -1;
		if ( $position > $rightmost ) {
			$rightmost =  $position;
			$rightmost_key = $key;
		}
	}
	return $rightmost_key;
}

sub original_rightmost {
  my( $string, @patterns ) = @_;

  my $rightmost = -1;
  while( my( $i, $pattern ) = each @patterns ) {
	my $position = $string =~ m/$pattern/ ? $-[0] : -1;
	$rightmost = $position if $position > $rightmost;
	}

return $rightmost; 		
}

__END__

