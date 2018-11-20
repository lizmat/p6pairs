
use v6;
use Test;
use Pair::More;

pass 'start testing';

ok Pair::More.new;

my $p = Pair::More.new(10, 20);

is $p.key,   10, 'get .key';
is $p.value, 20, 'get .value';

$p.key   = 30;
$p.value = 40;

is $p.key,   30, 'set .key';
is $p.value, 40, 'set .value';

$p.set(50, 60);

is $p.key,   50, 'setted .key';
is $p.value, 60, 'setted .value';

done-testing;

# vim: ft=perl6
