{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f5fb73ffede40b407766c6d0241193f51af5606f";
    sha256 = "sha256-89R52Hfu6ePQ2g7dNErrBjdkxmF5vbx9OTsGuD6N2ks=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
