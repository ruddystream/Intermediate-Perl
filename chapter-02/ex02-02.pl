#!/usr/bin/perl

###
# Chapter 02 Exercise 02
# ----------------------
# Install the local::lib module and use it when you install 
# Module::CoreList (or another module if you like). Write a program that 
# reports the name and first release date for all the modules in 
# Perl v5.14.2. Read the documentation for local::lib to see if it has 
# special installation instructions.
#

use strict;
use warnings;
use Local::Lib; # sets up local lib at ~/perl5.
use Module::CoreList;

my $max_length = 0;
my @module_list = sort keys $Module::CoreList::version{5.014002};

foreach my $mod ( @module_list ) {
	if ( $max_length < length $mod ) {
		$max_length = length $mod;
	}
}

print "First release of all the modules that were in core in v5.14.2:\n";
print "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n";

printf "%-${max_length}s %-12s\n", "Module Name", "Perl Version";
foreach my $mod ( @module_list ) {
	 printf " %-${max_length}s %-12s\n", $mod, Module::CoreList->first_release($mod);
}

__END__
