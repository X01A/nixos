{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-08-09";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "1bc7608f6f667fba76bb95c31ee6c1630ed6eaa2";
    fetchSubmodules = true;
    sha256 = "sha256-ctBO9+ZcgGeQBmDsh3jbKlN3Xg33PeBr9aWwd2FCc90=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
