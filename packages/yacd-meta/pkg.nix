{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.4.0-unstable-2026-09-14";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "e99551d4d6d0094e5f56705c076c4f5affba4beb";
    fetchSubmodules = true;
    sha256 = "sha256-0q/3IOkm3+bxKIsW/BGSt8Siy1+iExmU+/34wxuSKcc=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
