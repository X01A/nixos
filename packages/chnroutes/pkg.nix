{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "62ccd1ea21a7b04f58cba6541f7fae0173bf56a6";
    sha256 = "sha256-izEFwaOivu40gJBKztCTrNttaNo3h60043OQ3mufxHY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
