{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "434987917e351b6dddd60b9f1d7140caa1a31d5b";
    sha256 = "sha256-bPf5+axOniTSOnpQBGKUgFDaKxPtYkMxKUvSF0dSilA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
