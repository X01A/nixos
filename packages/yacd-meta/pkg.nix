{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-04-10";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "36f1a5d41bd620907c3603ed0537e6542c9097c9";
    fetchSubmodules = true;
    sha256 = "sha256-k/XtbH1EjNl7S4DU8fFTgd+eBUA/D+CnRjlm6lAaF24=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
