{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b397167df55468e1c328807dd4e2fe5afa3ebb6f";
    sha256 = "sha256-BU7WhEr2P8dykKj9Yfwe60B/U3kKnqatqIIcMPwC/Sc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
