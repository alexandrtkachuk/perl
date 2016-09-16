#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 16.09.2016 14:30:27
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use Cache::Memcached;
use Data::Dumper;

 my $cache = Cache::Memcached->new(
	 servers => ['127.0.0.1:11211']
 );


# присваиваем example_key значение 123
# # (время жизни - 2 часа или меньше, если кончится память)
#$cache->set('example_key', 123, 60*60*2);

#$cache->incr('example_key', 5);

my $val = $cache->get('example_key');
print "example_key = $val\n";

$cache->add('test_key2', 1);# добавляет, елси есть то не перетрет

$cache->replace('test_key3', 10);#просто перетирает, если нет то и несоздаст


my ($stats) = $cache->stats('items');

print Dumper($stats);

print "\n";
