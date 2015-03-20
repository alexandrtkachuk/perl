package Core::view;

use warnings;
use strict;

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
use Data::Dumper;

my $directory;
sub new
{


    my $class = ref($_[0])||$_[0];

    $directory=$_[1];


    return bless({ 
       'data'=>{},
       'cookies'=>undef #для работы с куками
        },$class);

}


sub loadTemplate
{
    my($filename)=@_;
    local $/=undef;
    open my $fh , "<$filename" or print "errr";
    my $html = <$fh>;
    close $fh;
    return $html;


}

sub helpRe
{
    my ($self,$i)=@_;
    
    if($self->{'data'}{$i})
    {
        return $self->{'data'}{$i};
    }

    return '';

}

sub meReplace
{
    my ($self,$text)=@_;
    #print Dumper($self->{'data'});
    #my %hash=( 'test'=>'good'  );
    #print $_[0];
    $text=~s/%%(\w+)%%/$self->helpRe($1)/ge;
    
    return $text;

}


sub setHeader
{
    my ($self)=@_;
    
    if($self->{'cookies'})
    {
        my $c= $self->{'cookies'};
        print "Set-Cookie: $c\n"
    
    }

    print "Content-type: text/html; encoding='utf-8'\n\n";
    }

sub viewTemplate
{   
    my ($self,$nfile)=@_;
    $self->setHeader();
    #$self->{'data'}{'name'}='sasha';
    my $templete=$directory."resources/template/$nfile.html";
    my $html=loadTemplate($templete );
    print $self->meReplace($html);
    
}

sub viewJSON
{
    my ($self,$str)=@_;
    $self->setHeader();
    print $str;
}





1;
