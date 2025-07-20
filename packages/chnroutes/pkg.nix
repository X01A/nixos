{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a9ae40c55b35e4c021c54a37f41dda4c7bf6d027";
    sha256 = "sha256-h5u2y+Ry0OqUOBANj+8Pyx9H5+qu7NdzmVzN5hHnkCM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
