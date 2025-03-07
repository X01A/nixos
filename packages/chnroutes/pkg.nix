{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e5aac9cc9d6f85ce4f6121720cae76293dfe1252";
    sha256 = "sha256-CfhApFERw9S/WD4mAiSW+rS3h5kUYbPKN0gcjTEkiH0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
