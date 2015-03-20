package Core::model;
use warnings;
use strict;
use JSON;

my $dir;
#конструктор
sub new
{

    $dir=$_[1];
    
    my $class = ref($_[0])||$_[0];

    return bless({ 
            
            'hash'=>{} #для данных 
        },$class);

}


sub msearch
{   
    my ($self,$arr,$s)=@_;
    for(my $i=0;$i<@$arr;$i++ )
    {
        if(@$arr[$i]->{'id'}==$s) 
        {
            return $i;
        }
    }

    return undef;


}

sub loadJSON
{

    my $file_name='<'.$dir.'shop.json';
    my $file_handle;
    my $str='';
    
    
    # открыть для чтения файл по имени, взятом из $file_name
    open($file_handle, $file_name);
    local $/=undef;
    
    $str=<$file_handle>; #читаем посточно и вводим
    close($file_handle) or die("Ошибка при закрытии файла: $!\n");
    
    return $str;
}

sub encodeJSON
{
    my ($self,$arr)=@_;
    return encode_json $arr;

}

sub decodeJSON
{
    my ($self,$str)=@_;
    return  decode_json $str;
}



1;
