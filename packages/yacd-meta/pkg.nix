{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-01";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "b94ba42b461f56ab79efb829f15f27ad7f7c0fee";
    fetchSubmodules = true;
    sha256 = "sha256-EMUFvDNoEs1zV1U+sCuVNL9sELytBfMKyOV4QWmfNdM=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
