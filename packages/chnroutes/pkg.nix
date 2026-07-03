{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8dcfeaa39e7db593a6aca823dcce00eb96cd0911";
    sha256 = "sha256-1SiuWK9MslJ/0MMYpDMCNsXEdcUCEdlklDu4TqE3jOw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
