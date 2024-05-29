{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0a24e930b78c3c813482b1574d850f5958c3dafd";
    sha256 = "sha256-4gMyxzEX4shiInbz/f7lp05LtulujdVvjxSMQcRGrOo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
