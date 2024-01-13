{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fa274fe4b2ee4647442b0fbc0d4c8dd20a6d117b";
    sha256 = "sha256-aD1dMKHP8qvWS//CjjLX/ZU5sTeIidYlxUpNKQu4+b8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
