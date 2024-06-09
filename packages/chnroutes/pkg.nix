{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d6d5520ff63b07395feeadada79bc585b662b03e";
    sha256 = "sha256-bV6yO+wkwWeAuj998/0+311Li3aiIa61PUVu9+j7tGI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
