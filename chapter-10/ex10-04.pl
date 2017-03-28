#!/usr/bin/perl

###
# Chapter 10 Exercise 04
# ----------------------
# Modify the recursive directory dumping routine so it shows the nested 
# directories through indentation. An empty directory should show up as:
# 
# sandbar, an empty directory
#
# while a nonempty directory should appear with nested contents, indented 
# two spaces.
#

use strict;
use warnings;
#use 5.018;

use Data::Dumper;
use File::Basename;

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) {        # files or symbolic links
    return undef;
  }
  if (-d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path("$path/$name");
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}

sub dump_data_for_path {
  my $path = shift;
  my $data = shift;
  my $level = shift;

  if (not defined $data) { # plain file
    print "$level" . basename( $path ) . "\n";
    return;
  } else {
    print "$level" . basename( $path ) . ", ";
  }

  if ( keys %$data ) {
    print "with contents:\n";
    foreach ( sort keys %$data) {
      dump_data_for_path("$path/$_", $data->{$_}, $level . '    ' );
    }
  } else {
    print "an empty directory.\n";
  }
}

my $path_data = data_for_path( '.' );
#print Dumper( $path_data );
dump_data_for_path( '.', $path_data, '' )

__END__

