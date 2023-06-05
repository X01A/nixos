{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-05";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "2870342eb1d6676fe14a3c2b5f75e0105df97d75";
    fetchSubmodules = true;
    sha256 = "sha256-YDPSEz28n+4R3fAWKzxeiUNSDNRlZoIBs+zyiARo4q0=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
