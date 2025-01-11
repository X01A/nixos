{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8f3897a3dfb2d71336686ac549ff19f24bb54437";
    sha256 = "sha256-e2gN0ePThGWBg9Z5Ug2ia65w9Ysu9PUlcCRhZa2aJtg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
