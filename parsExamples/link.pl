use strict;
use warnings;

use HTML::TreeBuilder::XPath;
use WWW::Curl::Easy;
use Data::Dumper;
use URI;



my ($url, $host) = ('http://192.168.56.100/~alexandr/', 'http://192.168.56.100/');


sub getURL
{
    my($url) = @_;
    my $curl = new WWW::Curl::Easy;

    $curl->setopt(CURLOPT_URL, $url);

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

    my($code, $body, $err) = getURL($url);
    if($code == 200) {
        my $tree = HTML::TreeBuilder::XPath->new_from_content($body);
        my (@search) = $tree->findvalues('//a/@href' );
        #print Dumper(@search);
        #print $body, "\n";
        return (@search);

    } else {
        print "code:", $code, "\tbad url: ", $url, "\n" ;
    }

    return ();
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
        } else {
            print $tempUrl, " - other\n";
        }

    }
}

load($url, $host);
