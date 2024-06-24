{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2024-06-23";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "e3e76f51c846e3f33862474b7f88cd83e3525dd1";
    fetchSubmodules = true;
    sha256 = "sha256-VmUM5y5f/y3s40o8WAd/3ywe/ExpYy94er/CcG32yH0=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
