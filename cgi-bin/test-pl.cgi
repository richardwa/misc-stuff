#!/usr/bin/perl
use strict;
use warnings;
use CGI qw/:standard/; 
 

print header(-type => 'text/plain');
my $uri = $ENV{REQUEST_URI};
my $base =  $ENV{SCRIPT_NAME}; 
print "hello, world";
