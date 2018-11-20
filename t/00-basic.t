
use v6;
use Test;
use Pair::More;

my \p = Pair::More.new(10, 20);

isa-ok p, Pair::More;

is p.key,   10, 'get key';
is p.value, 20, 'get value';

p.key   = 30;
p.value = 40;

is p.key,   30, 'set key';
is p.value, 40, 'set value';

p.set(50, 60);

is p.key,   50, 'setted key';
is p.value, 60, 'setted value';

# p.clear;
# 
# ok !defined p.key,   'cleared .key';
# ok !defined p.value, 'cleared .value';

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

# is p.Numeric, 2, '.Numeric';
# is +p, 2, '+';

# vim: ft=perl6
