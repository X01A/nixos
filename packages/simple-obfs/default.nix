{ source, stdenv, autoconf, automake, libtool, asciidoc, xmlto, libev, autoreconfHook, ... }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  nativeBuildInputs = [ autoconf automake autoreconfHook ];
  buildInputs = [ libtool asciidoc xmlto libev ];
}
