
my multi sub trait_mod:<is>(Method:D \m, :$aka!) { m.package.^add_method(~$_, m) for @$aka }  # see Method::Also

role Pair::More::Role[::KeyType, ::ValueType] {
    has KeyType   $.key   is rw;
    has ValueType $.value is rw;

    method   key-type { KeyType   }  # (--> KeyType)
    method value-type { ValueType }  # (--> ValueType)

    method is-symmetric(--> Bool) is aka<is-reflexive is-homogeneous> { self.key-type =:= self.value-type }  # { KeyType =:= ValueType }

    multi method new(KeyType $key, ValueType $value --> ::?ROLE) { self.new(:$key, :$value) }

    method set(KeyType \k, ValueType \v --> ::?ROLE) is aka<update> { ($!key, $!value) = (k, v); self }
}

class Pair::More does Pair::More::Role[Any, Any] {

    method elems(--> Int) is aka<Numeric Int> { 2 }

    proto method expand(::?CLASS:U: Any, Any) {*}
    multi method expand(List \k, List \v --> Seq) { (k X v).map: { self.new(|$_) } }
    multi method expand(List \k, \v --> Seq) { k.map: { self.new(:key($_), :value(v))  } }
    multi method expand(\k, List \v --> Seq) { v.map: { self.new(:key(k),  :value($_)) } }
    multi method expand(|c --> List) { (self.new(|c),) }

    method copy  (--> ::?CLASS) is aka<clone dup>         { self.new(:$!key, :$!value) }
    method invert(--> ::?CLASS) is aka<reverse flip anti> { self.new(:key($!value), :value($!key)) }  # antipair

    method clear     (--> ::?CLASS) is aka<reset>            { ($!key, $!value) = (Nil, Nil);       self }
    method inverted  (--> ::?CLASS) is aka<reversed flipped> { ($!key, $!value) = ($!value, $!key); self }
    method replace(\p --> ::?CLASS)                          { ($!key, $!value) = (p.key, p.value); self }

    method Pair (--> Pair)                { self ?? ($!key=>$!value) !! Pair  }
    method List (--> List) is aka<list>   { self ?? ($!key, $!value) !! List  }
    method Array(--> Array)               { self ?? [$!key, $!value] !! Array }
    method Range(--> Range) is aka<range> { self ?? ($!key..$!value) !! Range }

    proto method Hash(|) is aka<hash> {*}
    multi method Hash(::?CLASS:U: --> Hash) { Hash }

    multi method Str (::?CLASS:D: --> Str) { "$!key.Str() => $!value.Str()" }
    multi method gist(::?CLASS:D: --> Str) { "$!key.gist() => $!value.gist()" }
    multi method perl(::?CLASS:D: --> Str) { "Pair::More.new($!key.perl(), $!value.perl())" }

    method fmt(Str $fmt='(%s, %s)', Bool $reverse?, :$gist, :$perl --> Str) {
        sprintf $fmt, $reverse ?? self.List.reverse !! self.List;
    }
}

# vim: ft=perl6
