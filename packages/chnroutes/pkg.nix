{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e3e97390fff731caa789e01221800e2cead45719";
    sha256 = "sha256-6dLEmCAkTDTLdh+g3CrSuD6Xiy8I91vBz/yP/H4/vdM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
