#!/usr/bin/perl

use warnings;
use strict;

use Cache::Memcached;

print "Content-type: text/html\n\n";

my $cache = Cache::Memcached->new(
	 servers => ['127.0.0.1:11211']
 );

$cache->incr('example_key');
my $val = $cache->get('example_key');

print "val = $val <br>";

print "test_key:",$cache->get('test_key3'), "<br>";



 print "\n";
