{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "74983d0b2578f8dffdcac9613987f817821743bf";
    sha256 = "sha256-+N86wDvcxAk+sXquHpo6sjKZrJV5VDX6WisSgMuvp0c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
