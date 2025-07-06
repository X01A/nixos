{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1db4e8d5bbe9a2b6a1290b18763725e3cbff8db7";
    sha256 = "sha256-HbjIwg38XwpT6mDYdBltWuPsEVthnTX2Vk7wAKqNFKM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
