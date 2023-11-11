{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "210c8d2331e984f40e04bb2c92906c9aca6e314f";
    sha256 = "sha256-SnSpDmDiGf8eWSGcphPJIdf7Y7/Ka8056kfR9DuFBNw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
