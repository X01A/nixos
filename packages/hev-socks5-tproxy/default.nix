{ source, stdenv }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
