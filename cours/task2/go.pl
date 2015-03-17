#!/usr/bin/perl

use strict;
use Data::Dumper; 
use Models::first;


my $obj = Models::first->new(1,3,4,5);
print Dumper($obj);

$obj->foo();
print "hello\n";


