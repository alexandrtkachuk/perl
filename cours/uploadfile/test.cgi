#!/usr/bin/perl

use CGI;
my $cgi = new CGI;
my $dir = $cgi->param('dir');
my $file = $cgi->param('file');




$file=~m/^.*(\\|\/)(.*)/; # strip the remote path and keep the filename
print $cgi->header();
my $name = $2;
print $2;

eval {
    open( my $hf, ">$file") or die $!;
    while(<$file>) {
        print $hf $_;
    }
};
if($@)
{
    print "waring:<br>  \n ".$@." <br> \n ";
    
}
#print $cgi->header();
print "$file has been successfully uploaded... thank you.\n";
