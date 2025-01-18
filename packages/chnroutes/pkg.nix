{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c90cd9d008612ff4b4e4824d4ca3cba57a76c1f0";
    sha256 = "sha256-6Gutz/nEHd6JXNAbJIpn3tLVokx1b0fldntXfy3xvKM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
