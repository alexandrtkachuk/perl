#!/usr/bin/perl

use warnings;
use strict;
#my $dir = getcwd;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
#use CGI::Cookie; # позволит работать с куки
use CGI::Session;
use File::Basename;
use constant TDIR=>dirname(__FILE__);
use lib TDIR;

$|=1;

my $tdir=TDIR."/tmp";
my $cgi = CGI->new;

my $session = new CGI::Session("driver:File",undef, {Directory=>'/tmp'});

#$session->param("test", 99551);

my $test = $session->param("test");

unless($test)
{
    $session->param("test",1);

}
else
{
    $test++;
    $session->param("test",$test);


}

my $sid = $session->id();

my $cookie = $cgi->cookie(CGISESSID => $session->id);
    print $cgi->header( -cookie=>$cookie );
#print "Content-type: text/html; encoding='utf-8'\n\n";

print 'test'.$sid."\n param=".$session->param("test");




