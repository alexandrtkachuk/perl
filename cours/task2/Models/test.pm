package Models::test;
use warnings;
use strict;
use Models::interface;



#sub setTemp($);


 my $privatefoo = sub 
    {   
        
        print 'this is call private method'.$_[1]."\n";

    };

#конструктор
sub new
{

   


    my $class = ref($_[0])||$_[0];
    return bless({
            'temp'=>'',
            'pfoo'=>$privatefoo
        },$class);



}



sub setTemp($)
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




sub foo 
{   
    my ($self)=@_;
    $self->{pfoo}("\n me is send value \n");

    $self->$privatefoo("\n me is send value2 \n") ;
    return 1;
}




1;
