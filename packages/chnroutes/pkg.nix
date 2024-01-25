{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "658c3f6ebcdeefa2adeaf5409ffef432d2784521";
    sha256 = "sha256-StAS3OrcZHBPqV3gICqHI2mIYG8cVmGAzvhcVLZefyk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
