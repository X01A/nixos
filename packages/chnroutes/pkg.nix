{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "86098b18deaa3c4b2d0cc3e3ab74825be5f0a60e";
    sha256 = "sha256-fmTGNfQrcpNjyT8s3xlFvvqnl6F6sDBpfpclHq/yjmU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
