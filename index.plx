#!/usr/bin/perl
print "Content-type: text/html\n\n";
#@lines = `perldoc -u -f atan2`;
@lines = `ls -la`; #create massiv of result command
foreach(@lines)
{
    s/\w<([^>]+) /\U$1/g; #regular ne obazatelno
    print; # print item
}
