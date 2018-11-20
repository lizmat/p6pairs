
use Pair::More;
# use Pair::More::Ops;

unit module Pair::More::Util;

sub infix:<→>(|c) is export { Pair::More.new(|c) }
sub    paired(|c) is export { Pair::More.new(|c) }

# vim: ft=perl6
