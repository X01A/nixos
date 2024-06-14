{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3a37686c8e0ab4a3b7e18f72e80283cedfa6b7bf";
    sha256 = "sha256-Cy7d7VXxlv9E+nzkwnw4Df+YwemERj0L7snLGlwVqgA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
