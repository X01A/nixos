{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-09-07";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "698c6eda107397e7fe3338e458cae20433131474";
    fetchSubmodules = true;
    sha256 = "sha256-AWGcDl3kFlgZqWdr14vsXFncHRhkJ3/DgJZxI1BDqBI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
