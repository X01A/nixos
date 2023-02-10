{ stdenv, source, autoPatchelfHook, buildPhase ? "", ... }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;
  inherit buildPhase;

  nativeBuildInputs = [
    autoPatchelfHook
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    cp -R . $out
  '';
}
