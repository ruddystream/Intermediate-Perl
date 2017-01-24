#!/usr/bin/perl

###
# Chapter 02 Exercise 01
# ----------------------
# Read the list of files in the current directory and convert the names
# to their full path specification. Don’t use the shell or an external
# program to get the current directory. The File::Spec and Cwd modules,
# both of which come with Perl, should help. Print each path with four
# spaces before it and a newline after it.
#

use strict;
use warnings;
use File::Spec;
use Cwd qw( getcwd );


my $cwd = getcwd();

foreach my $direntry ( glob( ".* *" ) ) {
    my $newdirentry = File::Spec->catfile( $cwd, $direntry );
    print "    $newdirentry\n";
}

__END__

