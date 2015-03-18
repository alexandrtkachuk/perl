#!/usr/bin/perl

use warnings;
use strict;
use Modules::sql;
use Data::Dumper;



sub main
{

    my( $result , $cnt ,$sql, $err);

    (($sql =  Modules::sql->new('user7','localhost','user7','tuser7')) 
        && ($sql->connect())
        && ($sql->setQuery("SELECT * FROM anketa"))
        && ($sql->execute())
        && ($result = $sql->getResult())
        && ($cnt = $sql->getRows())
        && ($sql->DESTROY()))||
    (
        ($err=$sql->getError()) && 
        ($sql->DESTROY())    
    );


    if($result){
        print 'Количестко строк:'.$cnt."\n";
        print Dumper($result);
    }
    else
    {
        print 'Ошыбка:'.$err."\n";
    }

    return 1;
}

main();
#print $sql->getError() || 'no err';
#$sql->DESTROY();
#print Dumper($test);

