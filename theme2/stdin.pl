#!/usr/bin/perl

print 'Enter your name:';
$line = <STDIN>; #for user varible

$endl="\n";

if($line eq $endl )
{
    print 'no enter name'.$endl;
}
else
{   
    chomp($line); #del simvol \n
    print 'your name:'.$line.$endl;
}
