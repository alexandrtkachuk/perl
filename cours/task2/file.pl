#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;

my $file_name='<test.txt';
my $file_handle;



# открыть для чтения файл по имени, взятом из $file_name
open($file_handle, $file_name)
# # или аварийно завершить программу с выдачей сообщения
    or die("Ошибка открытия файла $file_name: $!\n"); #
#while(<$file_haldle>){ print  $_; }
while(<$file_handle> ){print $_;} #читаем посточно и вводим
#print $line.'eee'."\n";
close($file_handle) or die("Ошибка при закрытии файла: $!\n");

open($file_handle, '>test2.txt') or die('errr'); # файл может уже быть создан(
#или его может и не быть )

print $file_handle 'yes!';# пишим в файл

close($file_handle) or die("Ошибка при закрытии файла: $!\n");
