{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f8be67144da01ba5c2c91f95002900a3b458b02d";
    sha256 = "sha256-sba0sSp3qHb0CqvzF5JYsStXOiRVtBfGMaYY8euNpM0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
