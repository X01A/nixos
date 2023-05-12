{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "94edf94973b6fa80261d865165dceea72a4b40db";
    fetchSubmodules = true;
    sha256 = "sha256-FCK/UnlxwGibqrzk5saCtvBgcIhZHLqt0g/nGWLiseo=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
