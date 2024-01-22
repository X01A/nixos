{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "eb551b1ca2115fad5cd501e3a9645079a09c74ac";
    sha256 = "sha256-py8v6vnhZsKWti3/jDHP/hgCVudeAQ87r4IZDBxCDZA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
