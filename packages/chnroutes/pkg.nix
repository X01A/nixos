{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3e1c48fbcbfff57596358048ab85ebb151742155";
    sha256 = "sha256-Zo7eyfVv0DXM2sgmOKEggiB67WRqFaDHNHm3x6GuT5k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
