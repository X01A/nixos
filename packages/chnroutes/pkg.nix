{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "80264c61b7fcb12a97445e17bc91f9e94f1f9d8a";
    sha256 = "sha256-KQLvZMHV5HbB0mEXr7lmAIr8gXHE42yxshsJz83zwtY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
