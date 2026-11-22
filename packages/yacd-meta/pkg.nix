{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.8.0-unstable-2026-11-22";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "2f7bac07273230638219d02bd61d766c58a2da34";
    fetchSubmodules = true;
    sha256 = "sha256-8toTNY9R6uuQs1U0QFPS8q07uEWewVcA5nHAjla8zQs=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
