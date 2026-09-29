{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.5.0-unstable-2026-09-29";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "7873a0c67c279314dee30cf05774c673bc210328";
    fetchSubmodules = true;
    sha256 = "sha256-zYYwl/FQwZ8Di0kVK+rKEqxGWNn50pUNObGmceO1PYs=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
