package Models::myclass;
use Models::mystone;
use warnings;
use strict;


#конструктор
sub new
{
    
    
    my $class = ref($_[0])||$_[0];
    
    my $st=Models::mystone->new();
    return bless({
            'temp'=>'',
            'st'=>$st 
        },$class);

}



sub setTemp
{
    my ($self,$temp)=@_;
    $self->{'temp'}=$temp;
    return 1;
}

sub getTemp
{   
    my ($self)=@_;
    return $self->{'temp'};
}

sub getSt
{
    my ($self)=@_;
    return $self->{'st'}->getTest();


}
1;
