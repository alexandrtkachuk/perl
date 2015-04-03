# $Id: api3_file_freezethaw_incr.t,v 1.2 2002/11/22 22:54:41 sherzodr Exp $

use strict;


BEGIN { 
    use Test::More;
    # Check if DB_File is avaialble. Otherwise, skip this test
    eval 'require FreezeThaw';
    plan skip_all => 'FreezeThaw not available' if $@;

    plan(tests => 15); 
    use_ok('File::Spec');
    use_ok('CGI::Session',qw/-api3/);
};

#########################

my $dr_args = {Directory=>'t', IDFile=>File::Spec->catfile('t', 'cgisess.id')};
my $args    = "driver:File;serializer;FreezeThaw;id:Incr";

my $s = CGI::Session->new($args, undef, $dr_args );

ok($s);
ok($s->id);

$s->param(author=>'Sherzod Ruzmetov', name => 'CGI::Session', version=>'1'   );

ok($s->param('author'));
ok($s->param('name'));
ok($s->param('version'));


$s->param(-name=>'email', -value=>'sherzodr@cpan.org');

ok($s->param(-name=>'email'));
ok(!$s->expire() );

$s->expire("+10m");

ok($s->expire());

my $sid = $s->id();

$s->flush();

my $s2 = CGI::Session->new($args, $sid, $dr_args);

ok($s2);
ok($s2->id() eq $sid);
ok($s2->param('email'));
ok($s2->param('author'));
ok($s2->expire());

$s2->delete();
