package Core::controller;
use warnings;
use strict;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
use CGI::Cookie; # позволит работать с куки
#use CGI::Session::File;
use Data::Dumper; 

use Core::view;
use Core::model;

use vars qw(%in);
my $dir;# файл где находиться index файл
#my %in;
#конструктор
sub new
{

    $dir=$_[1];
    
    my $class = ref($_[0])||$_[0];

    return bless({ 
            'view'=>Core::view->new($dir) ,
            'model'=>Core::model->new($dir),
            'hash'=>{} #для данных которые будут выводться
        },$class);

}



sub go
{


    #получаем куки
    my %cookies = CGI::Cookie->fetch;

    my ($self)=@_;

    if(ReadParse())
    {
         
        if($in{'id'})
        {
            my $str=$self->{model}->loadJSON();

            my ($arr)= $self->{model}->decodeJSON($str);

            my($i)=  $self->{model}->msearch($arr, $in{'id'});
            
            $str= $self->{model}->encodeJSON($arr->[$i]);

            $self->{view}->viewJSON($str);



        }
        elsif($in{'login'})
        #elsif(1)
        {   
            
            $self->login();
            $self->{view}->viewTemplate('login');
        
        }
        else
        {   
            my $str=$self->{model}->loadJSON();    
            $self->{view}->viewJSON($str);
        }
        #rint  Dumper(%in); 
    }
    else
    {
        my $str=$self->{model}->loadJSON();    
        $self->{view}->viewJSON($str);

    }
    #$self->{view}->viewTemplate('index');
    
    print '<hr>';
    print "!!cooks:"; 
    print Dumper(%cookies); 
    print '<hr>';
    print Dumper(%ENV); 

    return 1;
    


}# end go


sub login
{

    my ($self)=@_;

    my $key;

    foreach $key ( sort keys %in){
        $self->{view}->{'data'}{$key}=$in{$key};
    }
    

    #set cookies
    

    my $c= CGI::Cookie->new(-name    =>  'foo3',
        -value   =>  ['bar','baz'],
        -expires =>  '-19');
    
    $self->{view}->{'cookies'}=$c;
}

1;
