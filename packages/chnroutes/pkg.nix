{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5fe085d1ef15b717338d1971bbba22e570c60279";
    sha256 = "sha256-AMTTl4N2sRbb3IjcOL9AnckFwOTp8D9/VBEAyPWp7jQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
