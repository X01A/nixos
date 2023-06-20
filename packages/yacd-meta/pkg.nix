{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-20";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "010e8e35cc65f619ba9c75d4294331429237e720";
    fetchSubmodules = true;
    sha256 = "sha256-wIGFoPK+cbdIo9xMN7/KmqQq1y+BOjwVraQWN7V1mQ0=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
