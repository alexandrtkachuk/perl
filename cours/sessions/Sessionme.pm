package Sessionme;
#user7
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use File::Basename;

use CGI::Session;
#Config::Config;
use warnings;
use strict;



my $self;
#my $tdir; 

#undef $self;
sub new
{   


    my $class = ref($_[0])||$_[0];
    
    my $session ;
    unless($self)
    {


        $session = new CGI::Session("driver:File",undef, {Directory=>'/tmp'});

        #print 'add';

    }

    $self||=bless(
        {   
            'session'=>$session,
            'id'=>$session->id() 
        }   
        ,$class);

    return $self;

}


sub getId
{   
    my ($self)=@_;
    return $self->{'id'};
}

sub delete
{
    my ($self)=@_;

    $self->{'session'}->delete();
    return 1;
}

sub setParam($$)
{
    my ($self,$param,$value)=@_;

    $self->{'session'}->param($param,$value);
    
    #print $tdir;
    return 1;
    

}

sub getParam($)
{
    my ($self,$param)=@_;
    
    #print 'Get='.$tdir."\n";
    return $self->{'session'}->param($param);

}

sub DESTROY
{

}

1;

