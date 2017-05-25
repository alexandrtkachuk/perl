use strict;
use warnings;

use HTML::TreeBuilder::XPath;
use WWW::Curl::Easy;
use Data::Dumper;
use URI; 
use Digest::MD5 qw(md5_hex);



my ($url, $host) = ('http://192.168.56.100/~alexandr/', 'http://192.168.56.100/');

my ($timeStart) = time;

sub getURL
{
    my($url) = @_;
    my $curl = new WWW::Curl::Easy;

    $curl->setopt(CURLOPT_URL, $url);
    $curl->setopt(CURLOPT_FOLLOWLOCATION, 1);
    $curl->setopt(CURLOPT_TIMEOUT, 120);
    
    my ($response_body);
    $curl->setopt(CURLOPT_WRITEDATA, \$response_body);


    $curl->perform;
    my $err = $curl->errbuf;
    my $info = $curl->getinfo(CURLINFO_HTTP_CODE);

    return ($info, $response_body, $err);
}

sub convertLink
{
    my ($link, $host, $baseUrl) = @_;
    my $retLink = $link;

    if($link eq '/' ) {
        $retLink = $host;
    } elsif($link =~m/^\.\./im) {
        #$retLink = $host . $link;
        $retLink =  URI->new_abs($link, $baseUrl);
    }elsif($link =~m/^https?:\//im) {
        #
    }else {
        $retLink =  URI->new_abs($link, $baseUrl);
    }

    return $retLink;
}

sub check
{
    my ($url, $host) = @_;
    #get and add to cache
    my($code, $body, $err);
    $body = loadFile($url);
    
    if(!$body) {
        ($code, $body, $err) = getURL($url);
    } else {
        $code = 200;
         $err  = 0;
    }

    if($code == 200) {
        my $tree = HTML::TreeBuilder::XPath->new_from_content($body);
        my (@search) = $tree->findvalues('//a/@href' );
        saveCache($url, $body);
        return (@search);
    } else {
        print "code:", $code, "\tbad url: ", $url, "\n" ;
    }

    return ();
}

sub saveCache
{
    my ($key, $body) = @_;

    my $filename = '/tmp/'.md5_hex($key) .  '.cache';
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $body;
    close $fh;
}

sub loadFile
{
    my $fileName = shift;
    $fileName = '/tmp/'.md5_hex($fileName) .  '.cache';
    return 0 unless(-e $fileName);

    local $/ = undef;
    open FILE, "$fileName" or die "Couldn't open file: $!";
    binmode FILE;
    my $string = <FILE>;
    close FILE;
    
    return $string;
}

sub load
{
    my ($url, $host) = @_;

    my(%hash);

    my (@urls) = check($url, $host);
    my ($temp);
    while( $temp = shift(@urls)) {
        my $tempUrl =  convertLink($temp, $host, $url);
        if (exists $hash{$tempUrl}) {
            #not do
        } elsif($tempUrl =~m/^http:\/\/192.168.56.100\//im) {
            print $tempUrl, "\n";
            $hash{$tempUrl} = 1;
            push(@urls, check($tempUrl, $host));
            #add to load
        } elsif($tempUrl =~m/^https?:/im) {
            #проверить его
            print $tempUrl, " - other load\n";
            check($tempUrl, 'none');
        } else { 
            print $tempUrl, " - other\n";
        }

    }
}

load($url, $host);

print "Work time:", time - $timeStart, "\n";
