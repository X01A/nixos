{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-10";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "e8f2a6632fa59f4d3af28acef05f74d2aeb2621a";
    fetchSubmodules = true;
    sha256 = "sha256-BpFMKFZnSfPmN5Ryr9JKDUX6q8sOv4/nP+sG7Qasy9o=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
