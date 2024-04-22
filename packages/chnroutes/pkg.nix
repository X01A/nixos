{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fe0539477b7a7c61a5af3bc99fa6b2c74303bb54";
    sha256 = "sha256-GOgApnVinmzk8azsbaya866UBaaVnsZhULRW2AitBbs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
