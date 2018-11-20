
use v6;
use Test;
use Pair::More;

my \p = Pair::More.new(10, 20);

isa-ok p, Pair::More;

is p.key,   10, 'get p.key';
is p.value, 20, 'get p.value';

p.key   = 30;
p.value = 40;

is p.key,   30, 'set p.key';
is p.value, 40, 'set p.value';

p.set(50, 60);

is p.key,   50, 'p.set(...).key';
is p.value, 60, 'p.set(...).value';

p.replace(Pair::More.new(1, 2));

is p.key,   1, 'replaced key';
is p.value, 2, 'replaced value';

is p.Str,  '1 => 2', '.Str';
is p.gist, '1 => 2', '.gist';
is p.perl, 'Pair::More.new(1, 2)', '.perl';

isa-ok p.Pair,  Pair;
isa-ok p.Array, Array;
isa-ok p.Hash,  Hash;
isa-ok p.List,  List;

done-testing;

# vim: ft=perl6
