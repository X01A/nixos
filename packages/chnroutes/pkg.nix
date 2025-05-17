{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "92f5b575f9a924bc4c809e7db10a38e2a768e8c1";
    sha256 = "sha256-7TsTCyP3gXoQkm1Ur2g6IyggHX3IkvCYzcAJp3z94jY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
