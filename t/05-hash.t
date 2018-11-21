
use v6;
use Test;
use Pair::More;

my \p = Pair::More.new('a', 1);

is-deeply p.Hash,                                 {a=>1},               'hash';
is-deeply p.Hash(:object),                       :{a=>1},               'hash :object';
is-deeply p.Hash(:named),                         {key=>'a', value=>1}, 'hash :named';
is-deeply p.Hash(:named, :object),               :{key=>'a', value=>1}, 'hash :named, :object';
is-deeply p.Hash(key=>'k', value=>'v'),           {k=>'a', v=>1},       'hash kwargs';
is-deeply p.Hash(key=>'k', value=>'v', :object), :{k=>'a', v=>1},       'hash kwargs :object';
is-deeply p.Hash('k', 'v'),                       {k=>'a', v=>1},       'hash pos args';
is-deeply p.Hash('k', 'v', :object),             :{k=>'a', v=>1},       'hash pos args :object';

done-testing;

# vim: ft=perl6
