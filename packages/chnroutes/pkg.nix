{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c78d32b15e8911dec0988abab654a27102cd217b";
    sha256 = "sha256-zFtAya655mKEFAXhgnOaVnil3AhnhPAFAbBfwxwc0iE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
