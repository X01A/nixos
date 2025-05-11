{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "18677582918ef9bc85bc8b7f15f6b08d32fc95c4";
    sha256 = "sha256-jVAHXdOF61PpaLbD/BOiEC1SidZ5U+aW9GpDGVaiN3w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
