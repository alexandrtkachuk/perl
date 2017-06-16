#!/usr/bin/perl

use Template;
use File::Basename;

use warnings;
use strict;

use constant TDIR=>dirname(__FILE__);

my $tt2 = new Template({
        INCLUDE_PATH => TDIR #Путь к каталогу с шаблонами
    });
my $vars={
    title=>'Заголовок страницы',
    items=>['Один', 'Два', 'Три', '99']
};

print "Content-type: text/html\n\n";
$tt2->process("page.html", $vars);
