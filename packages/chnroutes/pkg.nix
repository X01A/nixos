{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "491b0c2f0289318f50eca953659142c28d6282fd";
    sha256 = "sha256-SoLz6NxtIYDaGgmB6rcOLvEGH/3Xn2cNgDMpLmB44zQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
