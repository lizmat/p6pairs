
use v6;
use Test;
use Pair::More;

my \p = Pair::More.new(10, 20);

ok p, 'return is true';

isa-ok p, Pair::More;

# .elems and aliases
is p.elems,   2, '.elems';
is p.Numeric, 2, '.Numeric';
is p.Int,     2, '.Int';

is +p, 2, 'operator +';

is p.key,   10, 'get key';
is p.value, 20, 'get value';

p.key   = 30;
p.value = 40;

is p.key,   30, 'set key';
is p.value, 40, 'set value';

p.set(50, 60);

is ~p, '50 => 60', '.set(k, v)';

# p.clear;
# 
# ok !defined p.key,   'cleared .key';
# ok !defined p.value, 'cleared .value';

p.replace(Pair::More.new(1, 2));

is ~p, '1 => 2', '.replace(other)';

is p.Str,  '1 => 2', '.Str';
is p.gist, '1 => 2', '.gist';
is p.perl, 'Pair::More.new(1, 2)', '.perl';

## Coercions

is-deeply p.Pair,  1=>2,  'instance to pair';
is-deeply p.Array, [1,2], 'instance to array';
is-deeply p.List,  (1,2), 'instance to list';
is-deeply p.Range, 1..2,  'instance to range';

## Type object

is-deeply Pair::More.Pair,  Pair,  'type to pair';
is-deeply Pair::More.Array, Array, 'type to array';
is-deeply Pair::More.Hash,  Hash,  'type to hash';
is-deeply Pair::More.List,  List,  'type to list';
is-deeply Pair::More.Range, Range, 'type to range';

is Pair::More.gist, '(More)',     'type .gist';
is Pair::More.perl, 'Pair::More', 'type .perl';

done-testing;

# vim: ft=perl6
