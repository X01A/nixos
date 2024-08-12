{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "691106e30a4e33aef354f2daa2673d99c0062fb3";
    sha256 = "sha256-h3cO/gl4mR2OpfAnHNd6dExSsas8awBwVvg4euGenvw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
