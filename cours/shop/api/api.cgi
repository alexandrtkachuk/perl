#!/usr/bin/perl



#use vars qw(@INC);
#@INC = qw( Modules/ );

use lib 'Modules';
use warnings;
use strict;
use JSON;
use CGI qw/:standard/;

use Data::Dumper; 

#print Dumper(@INC);
my @arr=(
    { "id"=> 1, "title"=> "Сердце", "body"=>"Нормальное вообщем оно.. сойдет.", 
    "price"=> 120.59 , "image"=> "image1.png" }
    
);


#print Dumper(\$arr[0]);

#print $arr[0];

my $var = $arr[0];
#print "$_ \n" for %$var;
#print header;


#for($i=0;$i<%$var;$i++ )
#{
#    print %$var[$i]."\n";
#}

#выводимм хеш
#foreach $key (sort keys  %$var )
#{
#    print $key."\n";
#}

my $file_name='<shop.json';
my $file_handle;
my $str='';


# открыть для чтения файл по имени, взятом из $file_name
open($file_handle, $file_name);

while(<$file_handle> ){$str.=$_;} #читаем посточно и вводим
#print $str;
#print $line.'eee'."\n";
close($file_handle) or die("Ошибка при закрытии файла: $!\n");


my $test=decode_json $str;
print Dumper($test);
#my $test=decodeJSON($str);

#print '333';
