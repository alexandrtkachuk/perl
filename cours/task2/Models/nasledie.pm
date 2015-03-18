package Models::nasledie;
use warnings;
use strict;
use vars qw(@ISA); 

@ISA = qw(Models::test);



sub setTemp($)
{
    my ($self,$temp)=@_;
    $self->{'temp'}=$temp;
    print "перегрузили\n";
    return 1;


}




1;
