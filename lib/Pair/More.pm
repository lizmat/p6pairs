
my multi sub trait_mod:<is>(Method:D \m, :$aka!) { m.package.^add_method(~$_, m) for $aka }  # see Method::Also

role Pair::More::Role[::KeyType, ::ValueType] {
    has KeyType   $.key   is rw;
    has ValueType $.value is rw;
}

class Pair::More does Pair::More::Role[Any, Any] {

    multi method elems(|) is aka<Numeric Int> { 2 }

    multi method new($key, $value --> ::?CLASS) { self.new(:$key, :$value) }

    proto method expand(Any, Any) {*}
    multi method expand(List \k, List \v) { (k X v).map: { self.new(|$_) } }
    multi method expand(List \k, \v) { k.map: { self.new(:key($_), :value(v))  } }
    multi method expand(\k, List \v) { v.map: { self.new(:key(k),  :value($_)) } }
    multi method expand(|c) { self.new(|c) }

    method copy  (--> ::?CLASS) is aka<clone dup>         { self.new(:$!key, :$!value) }
    method invert(--> ::?CLASS) is aka<reverse flip anti> { self.new(:key($!value), :value($!key)) }  # antipair

    method clear     (--> ::?CLASS) is aka<reset>            { ($!key, $!value) = (Nil, Nil);       self }
    method inverted  (--> ::?CLASS) is aka<reversed flipped> { ($!key, $!value) = ($!value, $!key); self }
    method replace(\p --> ::?CLASS)                          { ($!key, $!value) = (p.key, p.value); self }
    method set(\k, \v --> ::?CLASS)                          { ($!key, $!value) = (k, v);           self }

    method Pair (--> Pair)              {  $!key=>$!value  }
    method Hash (--> Hash) is aka<hash> { {$!key=>$!value} }
    method List (--> List) is aka<list> { ($!key, $!value) }
    method Array(--> Array)             { [$!key, $!value] }

    method hashed($k='key', $v='value' --> Hash) { {$k=>$!key, $v=>$!value} }

    multi method Str (::?CLASS:D: --> Str) { "$!key.Str() => $!value.Str()" }
    multi method gist(::?CLASS:D: --> Str) { "$!key.gist() => $!value.gist()" }
    multi method perl(::?CLASS:D: --> Str) { "Pair::More.new($!key.perl(), $!value.perl())" }

    method fmt(Str $fmt='(%s, %s)', Bool $reverse? --> Str) {
        sprintf $fmt, $reverse ?? self.List.reverse !! self.List;
    }
}

# vim: ft=perl6
