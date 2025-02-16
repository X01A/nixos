{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1185b7d606152ed68336ab82b933a0cd03c5829a";
    sha256 = "sha256-Vnv2C6U58JouidrUn8qlL/BwNNu2HgpKpMF+w0Jh8Ws=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
