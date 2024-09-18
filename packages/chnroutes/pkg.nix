{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6e8b139ab20f2ccc393f0fbde5594d541a801488";
    sha256 = "sha256-HxYmVFaIA1dq3vOgN6JDfkSx2oDiO/lKFsP8uORXAHE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
