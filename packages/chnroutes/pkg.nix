{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ed0ac5d6fddf2fad31638c9a67e2c2a0a7dd6ecb";
    sha256 = "sha256-ScxVoLy+eDRhb1vQwUjmLFFsNpWGyQDhaIKoFT84VSQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
