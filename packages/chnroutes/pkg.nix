{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0a37238490137bb083a23a97532cf7f9e58a6989";
    sha256 = "sha256-5iZpTKW9Xyi6zoedbRmHqvDbVx/ZzzSxL4ejilTezAg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
