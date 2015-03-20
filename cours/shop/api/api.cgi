#!/usr/bin/perl


use warnings;
use strict;

# текущяя дериктория
use constant TDIR=>'/home/alexandr/www/html/perl2/perl/cours/shop/api/Modules/'; 
use lib TDIR;
#use lib "Modules";

use Core::controller;

sub main
{
    my  $control = Core::controller->new(TDIR);
    $control->go();

}



main();

