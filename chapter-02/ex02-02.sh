#!/usr/bin/env bash

###
# Chapter 02 Exercise 02
# ----------------------
# Install the local::lib module and use it when you install 
# Module::CoreList (or another module if you like).
#

echo "Installing local::lib globally (note: requires sudo):"
# Install local::lib
sudo cpan -i local::lib

echo "Installing Module::CoreList locallly:"
# Install Module::CoreList (locally)
cpan -I Module::CoreList
