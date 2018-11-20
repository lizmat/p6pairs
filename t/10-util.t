
use v6;
use Test;
use Pair::More;
use Pair::More::Util;

my \p1 = paired(1, 2);
my \p2 = 1 → 2;

ok p1, 'can create pair with sub';
ok p2, 'can create pair with syntax';

isa-ok p1, Pair::More;
isa-ok p2, Pair::More;

done-testing;

# vim: ft=perl6
