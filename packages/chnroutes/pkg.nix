{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9a6f5b9e532c3afb8085384de61726813a058339";
    sha256 = "sha256-y2I7Yd4Df/w2DAmGbhguP/E0fKJweirlCg4siJ+Kc40=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
