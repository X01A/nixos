{ source, lib, gcc8Stdenv, autoconf, automake, libtool, libev, autoreconfHook, ... }:

with lib;
gcc8Stdenv.mkDerivation rec {
  inherit (source) pname version src;

  configureFlags = [ "--disable-documentation" ];

  nativeBuildInputs = [ autoconf automake autoreconfHook ];
  buildInputs = [ libtool libev ];

  # MacOS support is broken
  meta.platforms = platforms.linux;
}
