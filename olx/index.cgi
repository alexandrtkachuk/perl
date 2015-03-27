#!/usr/bin/perl
use vars qw(@ISA @INC @EXPORT_OK );
use warnings;
use strict;
use Data::Dumper;
# текущяя дериктория
use constant TDIR=>'/home/alexandr/www/html/perl2/perl/olx/'; 
#use lib TDIR;
use lib '/usr/home/user7/public_html/perl/olx/';
#use  Controller::CtrlPage::test;

sub AUTOLOAD
{
    print '<hr />';
    print Dumper \@_;
    #print $AUTOLOAD;
    print 'tess';
}





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
    #print Dumper \@rout;
    return @rout;

}

#
#
#
#
sub main
{


    print "Content-type: text/html; encoding='utf-8'\n\n";
    print '<pre>', Dumper(\%ENV) , '</pre> <hr />'; 

    
    
    #mee();
    my $url1='CtrlPage';
    my(@rout)=router();
    #print Dumper(\@rout);
    my $tt=@rout;
    #print $tt;
    my $url2=$rout[$tt-1];
    my  $me='Controller/CtrlPage/'.$url2.'.pm';
    
    require  $me;
     "Controller::CtrlPage::$url2"->go();
    #print Dumper \@INC;
}


main();
