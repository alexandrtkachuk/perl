
use HTML::TreeBuilder::XPath;
use WWW::Curl::Easy;
use Data::Dumper;

my $curl = new WWW::Curl::Easy;
$curl->setopt(CURLOPT_URL, 'https://stackoverflow.com/');

my ($response_body);
$curl->setopt(CURLOPT_WRITEDATA, \$response_body);


$curl->perform;
my $err = $curl->errbuf;
my $info = $curl->getinfo(CURLINFO_HTTP_CODE);


my $tree = HTML::TreeBuilder::XPath->new_from_content($response_body);
my (@search) = $tree->findvalues('//a/@href' );
print Dumper(@search);
#print $response_body, "\n";


