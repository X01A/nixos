{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-09-05";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "85c58a3e7aeffae0a1e6707239ec69035fc26b7c";
    fetchSubmodules = true;
    sha256 = "sha256-gF3jIH8nr/WOBxGC/0SVLa/+9iC2Q23Eb4LOp21/oNc=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
