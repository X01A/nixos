{ source, stdenv }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  installPhase = ''
    mkdir $out
    tar -xf $src --strip-components=1 -C $out
  '';
}
