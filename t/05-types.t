
use v6;
use Test;
use Pair::More;

my \p = Pair::More.new;

ok p.key-type   =:= Any, 'default key type';
ok p.value-type =:= Any, 'default value type';

is-deeply p.is-symmetric, True, 'is symmetric';

done-testing;

# vim: ft=perl6
