{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ee8de30a23db78b3173de6c867521e8e7066e597";
    sha256 = "sha256-U+y5QIvfDh2P5VNQ59n3cp67OIgMd4wb2p1vVIXEup4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
