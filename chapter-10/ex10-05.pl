#!/usr/bin/perl

###
# Chapter 10 Exercise 05
# ----------------------
# Modify the iterative version of data_for_path to handle both depth-first 
# or breadth-first traversal. Use an optional third argument to allow the 
# user to decide which to use.
#

use strict;
no warnings;
use File::Basename;
use File::Spec::Functions;
use Data::Dumper;
use 5.018;

sub data_for_path {
	my $method = shift;
	my ( $path ) = @_;
	my $data = {};
	my @queue = ( [ $path, $data ] );
	while( my $next = shift @queue ) {
		my( $path, $ref ) = @$next;
		my $basename = basename( $path );

		$ref->{$basename} = do {
			if ( -f $path or -l $path ) { 
				undef; 
			} elsif ( $path =~ /.git.*/ ) {
				next;
			} else {
				my $hash = {};
				opendir my ($dh), $path;
				my @new_paths = map {
					catfile( $path, $_ )
				} grep { ! /^\.\.?\z/ } readdir $dh;

				if ( $method eq "dfs" ) {
					unshift @queue, map { [ $_, $hash ] } @new_paths;	
				} elsif ( $method eq "bfs" ) { 
					push @queue, map { [ $_, $hash ] } @new_paths;	
				}
				
				$hash;
			}
		};
	}
  $data;
}

my $method;

print "How should I get your data?\n\n";
print "  D)epth First Search?\n";
print "  B)readth First Search?\n\n";
print "MAKE YOUR CHOICE: ";

while ( 1 ) {
	
	chomp ( my $choice = <STDIN> );

	given ( $choice ) {
		when ( $_ =~ /[Dd]/ ) {
			$method = "dfs";
			last;
		}

		when ( $_ =~ /[Bb]/ ) {
			$method = "bfs";
			last;
		}

		default {
			print "TRY THAT AGAIN: ";
		}
	}
}

print "You have chosen: ";
if ( $method eq "dfs" ) {
	print "DEPTH FIRST SEARCH\n";
} else { 
	print "BREADTH FIRST SEARCH\n";
}
my $data = data_for_path( $method, '../..' );

print Dumper( $data );


__END__

