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
    my $c;
    if($self->{'cookies'})
    {
         $c= $self->{'cookies'};
        print "Set-Cookie: $c\n";
         
    }

    print "Content-type: text/html; encoding='utf-8'\n\n";
    print "<!--Set-Cookie: $c -->\n";
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
    my $head = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" 
"http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<meta http-equiv="Pragma" content="no-cache">
</head>
<body>';

my $footer= '</body> </html>';
    
    print $head;

    print $str;

    print $footer;
}





1;
