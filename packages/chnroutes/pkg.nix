{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c537747f8f6659c6ded7bfb31b06a0338cf1a089";
    sha256 = "sha256-CWdSxOix9rsw3JG/baJ2KpQCOnyh5kCldiDj9eEcaRU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
