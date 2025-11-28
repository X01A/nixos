{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "751d2f905ce1ba8735f351b4846299b6cdd9a69a";
    sha256 = "sha256-TAmYj+kDugCLjh+cszRO2qYzRT0TOS/kEW57mI89fxY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
