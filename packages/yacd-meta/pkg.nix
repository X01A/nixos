{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-03-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c0987c1a87b273f30081fa1a291ed2b36c732814";
    fetchSubmodules = true;
    sha256 = "sha256-DdeYvAZ8HemyBGqDx9qvp5tievjQ5mEOOYjjFksWLYw=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
