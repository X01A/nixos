{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "36b65551ed8dc99ad41445f49567d8547aadcf4b";
    sha256 = "sha256-+FnuvHHYh7ted0K2DaGM/3+Q3a3sSVcafj5XewV9VBg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
