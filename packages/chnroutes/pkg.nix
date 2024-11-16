{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "339ba1a0833b2e0849fffa0a5ee3c7f29b3e0eb5";
    sha256 = "sha256-4umoxVosCkzyIXb36f85+TpftJvYESwJHVRV1x+3E10=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
