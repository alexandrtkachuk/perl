package Models::myclass;
use Models::mystone;
use warnings;
use strict;

my $var1=9;
#конструктор
sub new
{
    
    
    my $class = ref($_[0])||$_[0];
    
    my $st=Models::mystone->new();

    
    return bless({
            'temp'=>'',
            'st'=>$st ,
            'var4'=>$var1
        },$class);

}



sub setTemp
{
    my ($self,$temp)=@_;
    $self->{'temp'}=$temp;
    $self->{'var1'}=$temp;
    return 1;
}

sub getTemp
{   
    my ($self)=@_;
    print "var1=".$var1."\n";
    return $self->{'temp'};
}

sub getSt
{
    my ($self)=@_;
    return $self->{'st'}->getTest();


}
1;
