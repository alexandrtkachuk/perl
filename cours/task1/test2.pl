#!/usr/bin/perl

use Data::Dumper;




@arr=('erewr',12,44);

print Dumper(@arr);

%hash= ('mkey1'=>'33', 'mkey'=>'test');

print Dumper(%hash);


$arr[3]='neww';
$hash{'mkey1'}=87;

print "------------------\n";
print Dumper(@arr);
print Dumper(%hash);



$link1=\@arr;

$link2=\%hash;

print "------------------\n";
print Dumper($link1);
print Dumper($link2);



###################
$link1->[3]=78;
$arr[2]=777;

$link2->{'newarr'}=[1,4,'meee',66];





print "------------------\n";
print Dumper($link1);
print Dumper($link2);

####################################

$link2->{'newarr'}[0]=99;


$link1->[7]={'key'=>11, 'key2'=>[]};
$link1->[7]{'key2'}[0]=67;



print "------------------\n";
print Dumper($link1);
print Dumper($link2);
