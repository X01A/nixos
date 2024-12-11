{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "118e2d411ce81159faeec2dceeab7cd389761ea9";
    sha256 = "sha256-2VLBEjTCPStw5ZGwXA+j6G4DK0/8LyIe4kgv9xfQJGo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
