{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.7.0-unstable-2026-11-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "b2ffb0db3ee16940836bf0def3deab8d94d266b5";
    fetchSubmodules = true;
    sha256 = "sha256-U4fL+ovA0mn8eBXPM1eckJ/F6RY8FEShF2EKcoso6O4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
