{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2d0ced021eab2b75214a63ba4c129997995e6221";
    sha256 = "sha256-652sRUTu9zs52n/bfrHpr1OFgWJu8/kSTMpSz5ohMu4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
