{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-16";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6953c42bf0b28f8eda546136347096beb106bd0c";
    fetchSubmodules = true;
    sha256 = "sha256-uxV90fyay0ocfBZ4wzH2fHbYbh0DewXvGAdkneQWU0s=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
