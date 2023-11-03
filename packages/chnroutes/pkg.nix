{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aee609ad10681695ac8f6b17bb6f0c5c55deb9aa";
    sha256 = "sha256-RocDliiQ1P1PUSRYkm1u76qK/xG2DBDMs9SiRw8Enks=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
