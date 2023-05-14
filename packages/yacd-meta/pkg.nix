{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-14";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "2a08ca837fe40f399b50bd59d49c7c1bb79b3db4";
    fetchSubmodules = true;
    sha256 = "sha256-9UiDdstRjX0ZQOaqwBSotCvpLyG+8g4g45FD4fvgHFM=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
