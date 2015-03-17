package Models::first;

use warnings;
use strict;
use Data::Dumper;


my $var1;
my($temp, $test);

#конструктор
sub new
{
    my $proto=shift;

    my $class = ref($proto) || $proto;

    my $self = {};

    bless($self,$class);

    return $self;
}



sub foo()
{   
    $var1=2;
    #print $var1; 
    #my ($self)=@_;
    #print 'test';

    foo2();

}


sub foo2()
{   
    
    
    print $var1;
    
}



sub foo3()
{
    $var1+=3;

}


1;
