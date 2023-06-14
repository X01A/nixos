{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-14";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "f2876c17419e95622a78c73d1aba10fda1a14a47";
    fetchSubmodules = true;
    sha256 = "sha256-MxkNQshAqkcXb0oiTmuBUx/W3g/sHCTq9pR+AHOhNtM=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
