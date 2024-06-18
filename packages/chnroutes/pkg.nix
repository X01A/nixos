{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f1b7980a1a4f0d1d458ac2b62177f6d8d345432e";
    sha256 = "sha256-7ij8zhml3ZNMyuSL+JdWArpGippsyVdW6BLnH3yoXok=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
