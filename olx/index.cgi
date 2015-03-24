#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
# текущяя дериктория
use constant TDIR=>'/home/alexandr/www/html/perl2/perl/olx/'; 
use lib TDIR;
#my $test2='::test';



sub router
{
    #возвращает массив путей
    #
    


    #s/$ENV{'REQUEST_URI'}/\/(w+)\//print $1/ge;
    #print  s/t1est2t1est/1(w+)1/$1/ge;
     
    #print Dumper \@rout;

    #print '<hr/>';
    #my $test='testsashatest';
    #$test=~s/test//;
    #print $test;
    my @sname=split /\//, $ENV{'SCRIPT_NAME'} ;

    my $test= $ENV{'REQUEST_URI'} ;
    for(@sname)
    {   
        $test=~s/$_\///;
        #print $_ ;
    }
    my @rout = split /\//, $test;
    print Dumper \@rout;


}

#
#
#
#

print "Content-type: text/html; encoding='utf-8'\n\n";
print '<pre>', Dumper(%ENV) , '</pre> <hr />'; 

router();

