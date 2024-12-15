{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "13f97af143b7e7977ac310828a7bc9c94de8167c";
    sha256 = "sha256-UjEFz41OPmUFtrgilFj2Q4bMbUSpTMc2iAs41KhwcoA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
