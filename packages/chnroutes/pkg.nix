{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "814d60b3a5b0e60b892170531d6c1572b402df4b";
    sha256 = "sha256-jkkwipSSHJr5tvrO88voHMgDka97Zpxq1gTftJON7ok=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
