{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cc629d56cf8ebf0827e5fadd790a027e52bb37ba";
    sha256 = "sha256-fbj6v4i6Wfeb+2CsY6WN16gMKnMGmUWWTR/gBGajaG8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
