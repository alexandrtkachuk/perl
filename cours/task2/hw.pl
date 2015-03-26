#!/usr/bin/perl

use warnings;
use strict;

use File::Basename;
use constant TDIR=>dirname(__FILE__);
use lib TDIR;

use Data::Dumper;
use Models::myclass;
use Models::mystone;
use Models::test;
use Models::nasledie;

my $obj = Models::myclass->new();
my $obj2 = Models::myclass->new();
my $st=Models::mystone->new();



$obj->setTemp(85);
print $obj->getTemp()."\n";

#my $obj2 = Models::myclass->new();
print "obj 2:  \n";
$obj2->{temp}=99;
print "внутрення:".$obj2->getTemp()."\n"; #не понял про общие переменные

#########################


$st->setTest(55);

print 'синглтон в main:'.$st->getTest()."\n";
print 'синглтон в классе:'.$obj->getSt()."\n";



#print Dumper($obj);

############################

my $test=Models::test->new();

$test->setTemp(6);
print $test->getTemp()."\n";

$test->foo();

print "\n Nasledie:";
my $test2=Models::nasledie->new();

$test2->setTemp(16);



print $test2->getTemp()."\n";

#print Dumper($test);

