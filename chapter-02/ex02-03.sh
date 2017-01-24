#!/usr/bin/env bash

###
# Chapter 02 Exercise 03
# ----------------------
# Parse the International Standard Book Number from the back of this 
# book (9781449393090). Install the Business::ISBN module from CPAN 
# and use it to extract the group code and the publisher code from the 
# number.
#

echo "Installing Business::ISBN globally (note: requires sudo):"
sudo cpan -i Business::ISBN
