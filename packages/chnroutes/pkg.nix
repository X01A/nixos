{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b103e2653611d3407e042b2bb4beb7ce3179a6e0";
    sha256 = "sha256-GJW6vI89D55kjc79sLtnGSg7LDZgLumSHGr39LQBURg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
