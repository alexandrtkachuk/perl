package Models::mystone;

use warnings;
use strict;



my $self;
#конструктор
sub new
{
    
    
    my $class = ref($_[0])||$_[0];
    $self||=bless({'test'=>''},$class);

    return $self;
}



sub setTest
{
    my ($self,$temp)=@_;
    $self->{'test'}=$temp;
    return 1;
}

sub getTest
{   
    my ($self)=@_;
    return $self->{'test'};
}


1;
