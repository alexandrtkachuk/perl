#!/usr/bin/perl


use warnings;
use strict;
#use File::Spec;
#my ($volume, $directory, $file) = File::Spec->splitpath(__FILE__);

my $directory= '/home/alexandr/www/html/perl2/perl/cours/shop/api/';
use lib "/home/alexandr/www/html/perl2/perl/cours/shop/api/Modules";
#use lib "Modules";
use JSON;

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
#use CGI::Cookie; # позволит работать с куки
#use CGI::Session::File;
use Data::Dumper; 
local %in;
 
#ReadParse();

sub msearch
{
    #print Dumper($_[0]);
    #for($_)
    #   {
    #        print $_->{'id'};
    #    }
        

        
   my($arr, $s)=@_; 
   #my $test=$_[0];
   #    my $s= $_[1];

   #print $s;
        for(my $i=0;$i<@$arr;$i++ )
        {
             if(@$arr[$i]->{'id'}==$s) 
             {
                return $i;
             }
        }

        return undef;


}

sub main
{
    print "Content-type: text/html; encoding='utf-8'\n\n"; 
    #print 'good';
    my $file_name='<'.$directory.'shop.json';
    my $file_handle;
    my $str='';


# открыть для чтения файл по имени, взятом из $file_name
    open($file_handle, $file_name);

    while(<$file_handle> ){$str.=$_;} #читаем посточно и вводим
    #print $str;
    #print $line.'eee'."\n";
    close($file_handle) or die("Ошибка при закрытии файла: $!\n");
    

    #param
    #print Dumper(param);
    #print param('id');
    #my $test=decode_json $str;
    #print Dumper($test->[0]);
    #
   if(ReadParse())
   {
        my $test=decode_json $str;
        #print Dumper(%in);
        #print param('id');
       my $i; 
        if( $i = msearch($test,$in{id}) )
        {
            #print Dumper($test->[$i]);
            
            print encode_json $test->[$i];
            
        
        }
        else
        {
            
            print encode_json $test->[0];
            
        }



    }
    else
    {
        print $str;
    } 

}


sub test
{
print Dumper(@INC);
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
}

main();

