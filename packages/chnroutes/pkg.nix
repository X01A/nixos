{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "20f85c2ddd8a9d1de7f486e4c822a213ceb9fd18";
    sha256 = "sha256-Lg4fgnT/vdMRvwhRI6aB2GMuRtUMYs1ec09KlEGTpfM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
