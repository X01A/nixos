{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e07e67986ace6fdd8d05e6078ba82c256fede8c2";
    sha256 = "sha256-2t47QCj16H7vwn5exslhBwvZVOoQgC94Ez7iNCBXrRU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
