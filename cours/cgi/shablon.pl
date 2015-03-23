#!/usr/bin/perl

use warnings;
use strict;

use File::Spec;
my ($volume, $directory, $file) = File::Spec->splitpath(__FILE__);


#my $dir = getcwd;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
#use CGI::Cookie; # позволит работать с куки
#use CGI::Session::File;

#RewriteEngine On
#RewriteBase /yourCodeDirFromRoot/
#RewriteCond %{REQUEST_FILENAME} !-f
#RewriteCond %{REQUEST_FILENAME} !-d
#RewriteRule ^(.*)$ index.cgi/$1 [PT]
$|=1;

ReadParse();



sub loadTemplate
{
    my($filename)=@_;
    local $/=undef;
    open my $fh , "<$filename" or print "errr";
    my $html = <$fh>;
    close $fh;
    return $html;


}

sub meReplace
{

    my %hash=( 'test'=>'good'  );
    #print $_[0];
    $_[0]=~s/%%(\w+)%%/$hash{$1}/ge;
    
    return $_[0];

}


sub main
{
    my $templete=$directory.'resources/template/index.html';
    print "Content-type: text/html; encoding='utf-8'\n\n";
    my $html=loadTemplate($templete );
    print meReplace( $html);
    
}

main();
