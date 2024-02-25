{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "23a278b3c77e0f05e01c4d672a5922e3a72a040d";
    sha256 = "sha256-lP5fO8nK+vDSe89tbGUQQgUS2yMo5aRLJ1yrOaf3Fm8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
