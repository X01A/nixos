{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c63d7caaf039abbf0b7abee4c55cd5a5de2f2aa9";
    sha256 = "sha256-aN/ZfzUEnDyof3T1PEDbbROBPq7nM9m0OubCTlYfTLw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
