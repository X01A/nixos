{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f5d0e21a6df7249816f8a465cee6674627aeaa95";
    sha256 = "sha256-8n3dOy0DdZpu1uo24+Q9pcxBd3/CZvEe6MyRXWMchoc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
