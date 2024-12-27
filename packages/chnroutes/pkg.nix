{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7ae3ace84d4f66609def5e9809664e47e54fd453";
    sha256 = "sha256-HTAt4g7ythy1Ng2hNRpigWWKsrYO/JXIqNNrxUO9TS8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
