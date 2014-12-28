use strict;

use Test::More tests => 2;

use Inline::Filters::Ragel;

my $val = ragel->(q{
  %%{ machine test; write data; }%%
  test input
  %%{ main := alnum*; write init; write exec; }%%
});

like($val, qr/test input/, 'has test input');
like($val, qr/#line/, 'has #line');
