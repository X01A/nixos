{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "efac0ee5662731583180b4f81dd3300642bcad26";
    sha256 = "sha256-mGFB/KN5shmmFF+1p+TIKcn07zNSHl0NLR8z6t8zqBU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
