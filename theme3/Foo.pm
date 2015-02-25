
package Foo;

use Exporter;

our @ISA= qw( Exporter );

 our @EXPORT = qw( test );

sub test
{
    print 'good'."\n";
}
