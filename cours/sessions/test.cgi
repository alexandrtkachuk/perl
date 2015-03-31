#!/usr/bin/perl

use warnings;
use strict;
#my $dir = getcwd;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
#use CGI::Cookie; # позволит работать с куки
#use CGI::Session;
use File::Basename;

use constant TDIR=>dirname(__FILE__);
use lib TDIR;
use Sessionme;


use Test;

$|=1;

my $tdir=TDIR."/tmp";
my $cgi = CGI->new;

my $session = undef; 
$session = Sessionme->new(); 

#$session->param("test", 99551);

my $test = undef; 
$test = $session->getParam("test");

unless($test)
{
    $session->setParam("test",1);

}
else
{
    $test++;
    $session->setParam("test",$test);


}

my $sid = $session->getId();

my $cookie = $cgi->cookie(CGISESSID => $sid);
    print $cgi->header( -cookie=>$cookie );
#print "Content-type: text/html; encoding='utf-8'\n\n";

print 'test'.$sid."\n param=".$session->getParam("test");


print "\n <br>";
Test->test($session->getParam("test"));

undef $session;


